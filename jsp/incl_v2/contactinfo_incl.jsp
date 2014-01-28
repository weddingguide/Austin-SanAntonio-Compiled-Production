<script>
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

   function getEmailExpandCollapse( elementId, image, messageId, id )
   {
      expandIt( elementId, image );

      var ajaxRequest = getAjaxRequestObject();

      var mailContainer = document.getElementById( elementId );
      ajaxRequest.onreadystatechange = function() { displayMailContents( ajaxRequest, mailContainer );} ;

      ajaxRequest.open("GET", "ajaxGetMailMessage.jsp?messageId="+messageId+"&id="+id, true);
      ajaxRequest.send(null);
   }

   function displayMailContents( ajaxRequest, mailContainer )
   {
      if(ajaxRequest.readyState == 4)
      {
         mailContainer.innerHTML = ajaxRequest.responseText;
      }
   }

</script>

<%
      Person aPerson = new Person( dbData, -1); // initialize it
      if ( request.getParameter( "cisaction" ) != null )
      {
         String personLabel = "person";

         aPerson = new Person( dbData,  jspUtils.getIntParm("personId") ); //load from db
         aPerson.deepPopulate();                                                                        // populate from db

         if ( request.getParameter( "cisaction" ).equals( "Submit" ) )
         {
            aPerson.populateObject( request, personLabel );                                                //update from form
            aPerson.deepPopulate(request, personLabel );

            if ( request.getParameter( "omitGroups" ) != null ) aPerson.setUpdateGroups( false );

            boolean updateFlag = aPerson.isRecordFound();

            aPerson.createOrUpdateRecord( "PERSON" );
            int personId = aPerson.getPersonId();

            new History( dbData, currUser.getUserName(), History.OWNERTYPE_PERSON, personId, History.TYPE_RECORD_UPDATE, "update","", "HISTORY" );
            new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "Change person info for: " + aPerson.getFirstName() + " " + aPerson.getLastName(), "", "HISTORY" );
         }
      }
      if ( request.getParameter( "update" ) != null )
      {
         GroupMemberMapList mapList = new GroupMemberMapList( dbData, EntityGroup.TYPE_CONTACTCONTAINER, aContact.getId(), true );
         for ( int i = 0; i < mapList.getRecordList().length; i++ )
         {
            GroupMemberMap aMap = (GroupMemberMap) mapList.getRecordList()[i];
            int memberId = aMap.getMemberId();
            if ( jspUtils.getIntParm( "primary" ) == memberId )
            {
               aMap.setPrimaryMember( 1 );
            }
            else
            {
               aMap.setPrimaryMember( 0 );
            }

            aMap.setMemberType( Person.RECORDTYPE_PERSON ); // just force it due to an early bug that set some incorrectly

            aMap.createOrUpdateRecord( "GROUPMEMBERMAP" );
         }
         new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "Change primary contact person","", "HISTORY" );
      }

      if ( request.getParameter( "updategroups" ) != null )
      {
         EntityGroupList groupList = new EntityGroupList( dbData, EntityGroup.TYPE_GENERAL, request );
         GroupMemberMapList.setMappings( dbData, groupList, EntityGroup.TYPE_GENERAL, ObjectClassID.CONTACT, aContact.getId(), "GROUPMEMBERMAP");
         new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "Change group membership","", "HISTORY" );
      }

      if ( request.getParameter( "notetext" ) != null )
      {
         new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), jspUtils.getIntParm("eventType"), request.getParameter("notetext"),"", "HISTORY" );
      }

      if ( request.getParameter( "updatecontactname" ) != null )
      {
         if ( request.getParameter( "updatecontactname" ).equals( "Update" ))
         {
            new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE,
                         "Change name from \""+aContact.getName()+"\" to \""+request.getParameter("contactName")+"\"",
                         "",
                         "HISTORY" );
            aContact.setName( request.getParameter( "contactName" ));
            aContact.setType( ObjectClassID.CONTACT );
            aContact.setCategory( 3 );
            aContact.updateRecord( "ENTITYGROUP" );
         }
         if ( request.getParameter( "updatecontactname" ).equals( "Create" ))
         {
            aContact.setName( request.getParameter( "contactName" ));
            aContact.setType( ObjectClassID.CONTACT );
            aContact.setCategory( 18 ); //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ SHOULD NOT HARDCODE!!!!!!! curr set for WGBE
            aContact.createRecord( "ENTITYGROUP" );
            new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE,
                         "Create new contact: \""+request.getParameter("contactName")+"\"",
                         "",
                         "HISTORY" );
         }
      }

%>
<%          if ( request.isUserInRole( "CISOperator" ) )
            {
%>
                 <x:set select="$doc/jwmbos/contactlists/contactlist/contact" var="contact"/>

                 <div class="shadowbox">

                   <x:if select="$contact/stickyNotes/historyItem">
                      <div class="notesbox">
                        <h4>Notes:</h4>
                        <ul>
                        <x:forEach select="$contact/stickyNotes/historyItem" var="sticky">
                          <li><x:out select="$sticky/@description"/>
                        </x:forEach>
                        </ul>
                      </div>
                   </x:if>
<%
          }
%>

           <h4>Name: <%=aContact.getName()%></h4>
<%          if ( request.isUserInRole( "CISOperator" ) )
            {
               String buttonText = "Update";
               if (!aContact.isRecordFound()) buttonText = "Create";
%>
               <form action="<%=self.getJspName()%>" method="post">
                  <input name=contactName value="<%=aContact.getName()%>">
                  <input type=hidden name=contactId value=<%=aContact.getId()%>>
                  <input type=submit name=updatecontactname value="<%=buttonText%>">
               </form>
<%
            }
            if ( request.isUserInRole( "CISOperator" ) )
            {
               // NOTE-- aContact is curr an EntityGroup and not a Contact object... getStatus MUST be called on contact objects
               Contact trueContactObj = new Contact( dbData, aContact.getId() );
               ProjectStatus pStatus1 = new ProjectStatus( dbData, trueContactObj.getStatus() );
%>
            <hr>
            <table border=1>
               <tr valign=top>
                  <td style="width:35%">
                      <h3>Contact Status:</h3>
                          <span id=contactstatusRO>
                             <%=pStatus1.getHTML()%>
                          </span>
                      <h3>Tracking Date:</h3>
                       <div class="<x:out select="$contact/@trackingDateClass"/>" style="text-align:left">
                          <x:set var="htmltmp" select="string($contact/@trackingDate)"/>
                          <c:out value="${htmltmp}" escapeXml="false"/>
                       </div>

                  </td>
                  <td>
                    <x:set var="contact" select="$doc/jwmbos/contactlists/contactlist/contact" />
                    <%@ include file="projectCell_incl.jsp" %>
                 </td>
              </tr>
           </table>
<%
               int sendMailId = aContact.getId();
               int sendMailType = ObjectClassID.CONTACT;

               ArrayList templateQualifiersArray = new ArrayList();

               templateQualifiersArray.add( pStatus1.getName() );

               EntityGroupList currGroups = new EntityGroupList( dbData, aContact.getId(), true, true, true);
               for ( int i = 0; i < currGroups.getRecordList().length; i++ )
               {
                  EntityGroup aGroup = (EntityGroup) currGroups.getRecordList()[i];
                  templateQualifiersArray.add( aGroup.getName() );
               }

               String[] templateQualifiers = new String[1];
               templateQualifiers = (String[]) templateQualifiersArray.toArray( templateQualifiers );


            }
%>
            <hr>
            <%@ include file="contactpeople_incl.jsp" %>
<%          if ( request.isUserInRole( "CISOperator" ) )
            {
%>
               <%@ include file="contactgroups_incl.jsp" %>

                  <!-- (Events old way) %@ include file="contactattributes_incl.jsp" % -->
<%
            }
%>

<%          if ( domainId != 5 ) // need to create siteproperties for all of these modules on contact page... ######################
            {
%>
                <%@ include file="contactaccounts_incl.jsp" %>
<%
            }
%>

<%          if ( request.isUserInRole( "CISOperator" ) )
            {
%>
               <hr>
               <%@ include file="contacthistory_incl.jsp" %>
<%
            }
%>
         </div>
