<%
   if ( request.isUserInRole( "WGBEVendor" ))
   {
      Contact aContact = new Contact( dbData, currUser.getOwnerId() );
      aContact.deepPopulate();
      boolean activeVendor = false;

      for ( int i=0; i < aContact.getPersonList().getRecordList().length; i++ )
      {
         Person aProfile = (Person) aContact.getPersonList().getRecordList()[i];
         if ( aProfile.getSiteDefEntityType() == 1 )
         {
            activeVendor = true;
            break;
         }
      }
      if ( !activeVendor )
      {
         out.print( "<h2>Account is Inactive</h2>");
      }
      else
      {
%>
          <h2>Lead List</h2>
          <%
               SimpleDateFormat intFormat= new SimpleDateFormat ("yyyy-MM-dd HH:mm");
               SimpleDateFormat extFormat= new SimpleDateFormat ("EEEE, MMMM d, yyyy hh:mm a");

               String afterDate = request.getParameter( "since" );
               if ( afterDate == null )
               {
          %>
                  <form action="/wgbe/jsp/guest/LeadListForwarder.jsp" method="get">
                      Leads since:
                      <input name=since id=datepicker size=40 value="<%=extFormat.format( currUser.getLastLogin())%>">
                      <input type=hidden name=leads value="*">
                      <br><font size=-2><i>Default last logged on date/time<i></font>
                      <br><input name=submit type=submit value="Comma Delimited (Excel)">
                      <br><input name=submit type=submit value="XML">
                      <br><input name=submit type=submit value="Labels">
                  </form>
          <%
               }
               else
               {

                  ContactList leads = new ContactList( dbData, currUser.getOwnerId(), intFormat.format( extFormat.parse(afterDate)) );
                  for ( int i =0; i < leads.getRecordList().length; i++ )
                  {
                     Contact aLead = (Contact) leads.getRecordList()[i];
                     out.print( "<br><b>"+aLead.getName() + "</b><font size=-2><i> (created: " + extFormat.format(aLead.getLastUpdate()));
                     EntityGroupList groupList = new EntityGroupList( dbData, "Lead List Groups", ObjectClassID.CONTACT, aLead.getId() );
                     dbData.getLog().logEvent( "------------" + aLead.getName() );
                     for ( int j=0; j<groupList.getRecordList().length; j++ )
                     {
                        EntityGroup aGroup = (EntityGroup) groupList.getRecordList()[j];
                        out.print (" -- " + aGroup.getName() );
                     }
                     out.println(  "</i></font>)" );
                  }
               }
      }
   }
%>
