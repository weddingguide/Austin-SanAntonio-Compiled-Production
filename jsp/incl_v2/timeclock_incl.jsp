<div class="mediumWidthContainer">
<script>
   function getPayPeriodExpandCollapse( elementId, image, personId, payPeriod )
   {
      expandIt( elementId, image );

      var ajaxRequest = getAjaxRequestObject();

      var payPeriodContainer = document.getElementById( elementId );
      ajaxRequest.onreadystatechange = function() { displayPayPeriodContents( ajaxRequest, payPeriodContainer );} ;

      ajaxRequest.open("GET", "/cis/jsp/operator/ajaxGetPayPeriod.jsp?personId="+personId+"&payPeriod="+payPeriod, true);
      ajaxRequest.send(null);
   }

   function displayPayPeriodContents( ajaxRequest, payPeriodContainer )
   {
      if(ajaxRequest.readyState == 4)
      {
         payPeriodContainer.innerHTML = ajaxRequest.responseText;
      }
   }

   function getAjaxRequestObject()
   {
      var ajaxRequest;
      try
      {
         ajaxRequest = new XMLHttpRequest();
      }
      catch (e)
      {
         try
         {
            ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
         }
         catch (e)
         {
            try
            {
               ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e)
            {
               alert("Browser not supported for attribute updates");
               return false;
            }
         }
      }
      return( ajaxRequest );
   }
</script>

<%
      if ( request.getParameter( "formInstanceId" ) != null ) // using this to see if the form was submitted, only care about newFormSubmit & resubmit msg if form
      {
         if ( newFormSubmit )
         {
            if ( request.getParameter( "endPayPeriod" ) != null )
            {
               // close the curr PayPeriod Event
               Event currPayPeriod = new Event( dbData, jspUtils.getIntParm( "currPayPeriod" ));
               currPayPeriod.setStatus( Event.STATUS_PAY_PERIOD_CLOSED );
               currPayPeriod.setEndTimeStamp( new java.sql.Timestamp( (new Date().getTime() ) ));
               currPayPeriod.updateRecord( "EVENTS" );


               Event newPayPeriod = new Event( dbData );
               newPayPeriod.setOwnerType( ObjectClassID.PERSON );
               newPayPeriod.setOwnerID(jspUtils.getIntParm( "personId" ) );
               newPayPeriod.setBgnTimeStamp( new java.sql.Timestamp( (new Date().getTime() ) ));
               newPayPeriod.setType( Event.TYPE_PAY_PERIOD_GROUP );
               newPayPeriod.setStatus( Event.STATUS_CURR_PAY_PERIOD );
               newPayPeriod.setEventGroupId( currPayPeriod.getEventGroupId()+1);
               newPayPeriod.createRecord( "EVENTS" );
            }

            if ( request.getParameter( "ClockIn" ) != null )
            {
               Event currPayPeriod = new Event( dbData, jspUtils.getIntParm( "currPayPeriod" ));
               Event openTimeCardEntry = new Event( dbData, ObjectClassID.PERSON,jspUtils.getIntParm( "personId" ), Event.TYPE_TIMECARD_ENTRY, true );
               openTimeCardEntry.setBgnTimeStamp( new java.sql.Timestamp( (new Date().getTime() ) ));
               openTimeCardEntry.setEventGroupId( currPayPeriod.getEventGroupId());
               openTimeCardEntry.createRecord( "EVENTS" );
            }

            if ( request.getParameter( "ClockOut" ) != null )
            {
               Event openTimeCardEntry = new Event( dbData, ObjectClassID.PERSON,jspUtils.getIntParm( "personId" ), Event.TYPE_TIMECARD_ENTRY, true );
               openTimeCardEntry.setEndTimeStamp( new java.sql.Timestamp( (new Date().getTime() ) ));
               openTimeCardEntry.setStatus( Event.STATUS_TIMECARD_CLOSED_ENTRY );
               openTimeCardEntry.setDescription( request.getParameter( "timecardnotes" ) );
               openTimeCardEntry.updateRecord( "EVENTS" );
            }
         }
         else
         {
           out.print( "** page refresh **" );
         }
      }

%>
      <h1 class="fancy">Time Clock</h1>
      <div class="shadowbox">



           <img src="/images/plus.gif" id="timeClockLogImg" onClick="expandIt('timeClockLog', this);"> <b>Time Card Log</b>
           <div id=timeClockLog style="display:none">
            <h3>Pay Periods</h3>
            <table style="width:100%">
               <tr>
                 <th>&nbsp;</th>
                 <th>Status</th>
                 <th>Pay Period</th>
                 <th>Start</th>
                 <th>End</th>
                 <th>Total Hours</th>
               </tr>
<%
            double payPeriodHours = 0;

            NumberFormat formatter = new DecimalFormat("#0.0");
            SimpleDateFormat dateFormatter = new SimpleDateFormat ("MMM d, yyyy hh:mma");

            int currPayPeriod = -1;
            int currPayPeriodRecordNdx = -1;

            EventList payPeriods = new EventList( dbData, ObjectClassID.PERSON, timeClockPerson.getPersonId(), Event.TYPE_PAY_PERIOD_GROUP, true, "DESC");

      dbData.getLog().logEvent( payPeriods.getStackTrace() );

            int row=0;
            for (int j=0; j< payPeriods.getRecordList().length; j++)
            {
               String rowClass = "row1";
               if ( row++ % 2 != 0 ) rowClass="row0";
               Event payPeriod = (Event) payPeriods.getRecordList()[j];

               payPeriodHours = 0; // start over with new pay period
               EventList eventList = new EventList( dbData, ObjectClassID.PERSON, timeClockPerson.getPersonId(), Event.TYPE_TIMECARD_ENTRY, payPeriod.getEventGroupId(), "ASC");
               for (int k=0; k< eventList.getRecordList().length; k++)
               {
                  Event timeCardEntry = (Event) eventList.getRecordList()[k];

                  Calendar clockInDateC  = Calendar.getInstance();
                  clockInDateC.setTime( timeCardEntry.getBgnTimeStamp() );

                  Calendar clockOutDateC = Calendar.getInstance();
                  clockOutDateC.setTime( timeCardEntry.getEndTimeStamp() );

                  double thisEntryHours = ((double) ( clockOutDateC.getTimeInMillis() - clockInDateC.getTimeInMillis() )) / DBEnhDateColumn.MILLISPERHOUR;
                  payPeriodHours += thisEntryHours;
               }
%>
               <tr class=<%=rowClass%>>
                 <td>
                   <img src="/images/plus.gif" id="payperiod<%=j%>Img" onClick="getPayPeriodExpandCollapse('payperiod<%=j%>', this, <%=timeClockPerson.getPersonId()%>,<%=payPeriod.getEventGroupId()%>);">
                 </td>
                 <td>
<%
                   if ( payPeriod.getStatus() == Event.STATUS_CURR_PAY_PERIOD )
                   {
                      out.print( "<font color=red><b>Current</b></font>" );
                      currPayPeriod = payPeriod.getEventGroupId();
                      currPayPeriodRecordNdx = payPeriod.getId();
                   }
                   if ( payPeriod.getStatus() == Event.STATUS_PAY_PERIOD_CLOSED ) out.print( "<b>Closed</b>" );
%>
                 </td>
                 <td>
                   <%=payPeriod.getEventGroupId()%>
                 </td>
                 <td>
                    <%=dateFormatter.format( new java.sql.Date(payPeriod.getBgnTimeStamp().getTime()))%>
                 </td>
                 <td>
                    <%=dateFormatter.format( new java.sql.Date(payPeriod.getEndTimeStamp().getTime()))%>
                 </td>
                 <td style="text-align:right">
                     <%=formatter.format( payPeriodHours )%>
                 </td>
               </tr>
               <tr>
                 <td colspan=6>
                   <div id=payperiod<%=j%> style="width:600px; display:none; border:2px solid black">
                      [Loading timecard for pay period...]
                   </div>
                 </td>
               </tr>
<%
            }
%>
            </table>
           </div>

<%
            Event openTimeCardEntry = new Event( dbData, ObjectClassID.PERSON, timeClockPerson.getPersonId(), Event.TYPE_TIMECARD_ENTRY, true );
            String statusText = "Out";
            if ( openTimeCardEntry.isRecordFound() ) statusText = "In";
%>

           <table>
             <tr>
               <td>
                  You are currently
               </td>
               <td>
                  <h3 class="siteColor">Clocked <%=statusText%></h3>
               </td>
               <td>&nbsp;
<%
                  if (openTimeCardEntry.isRecordFound() )
                  {
%>
                    Since: <%=dateFormatter.format( new java.sql.Date(openTimeCardEntry.getBgnTimeStamp().getTime()))%>
<%
                  }
%>

             </tr>
           </table>

           <hr>

         <form action="<%=self.getJspName()%>" method="get">

            <input type="hidden" name="personId" value="<%=timeClockPerson.getPersonId()%>">
            <input type="hidden" name="formInstanceId" value="<%=formInstanceId%>">
            <input type="hidden" name=currPayPeriod value=<%=currPayPeriodRecordNdx%>>

<%

            if (openTimeCardEntry.isRecordFound())  // currently clocked in if found
            {
%>
               <input type="hidden" name=TimeCardEntryRecordNdx value=<%=openTimeCardEntry.getId()%>>
               <input type="submit" name="ClockOut" value="Clock Out">
               <br>Notes: <input type="text" name="timecardnotes" size="50">
<%
            }
            else
            {
%>
               <input type="submit" name="ClockIn" value="Clock In">
<%
               if (request.isUserInRole( "timeClockAdministrator" ))
               {
%>
                  <input type="submit" name="endPayPeriod" value="End Pay Period" >
<%
               }
            }
%>
         </form>

      </div>
</div>
