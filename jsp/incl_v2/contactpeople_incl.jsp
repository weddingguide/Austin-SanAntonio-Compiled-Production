<script>
          function validateRemove(aPerson)
          {
             if (confirm( 'Confirm remove: "' + aPerson +'"?' )) return true;
             return(false);
          }

          function validateCloneAddress(aPerson)
          {
             if (confirm( 'Confirm clone address of primary to: "' + aPerson +'"?' )) return true;
             return(false);
          }
</script>
<%
   PersonList personListSearchResults = new PersonList( dbData );
   int personId = jspUtils.getIntParm( "personId" );

   if ( request.getParameter( "remove" ) != null )
   {
      aContact.removeMember( personId );
      new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "Removed person","ID="+personId, "HISTORY" );
   }
   if ( request.getParameter( "actioncontactsearch" ) != null )
   {
      int personType = Person.RECORDTYPE_PERSON;
      if ( site.equals( "wgbe" )) personType = Person.RECORDTYPE_BUSINESS_ORG;

      personListSearchResults = new PersonList( dbData, personType, request.getParameter( "searchcriteria" ) );
   }
   if ( request.getParameter( "selectcontact" ) != null )
   {
      GroupMemberMap map = new GroupMemberMap( dbData, aContact.getId(), Person.RECORDTYPE_PERSON, jspUtils.getIntParm( "contactselect" ));
      map.createOrUpdateRecord( "GROUPMEMBERMAP" );
      new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "Add person from search", "ID=" + personId + " " + aPerson.getName(), "HISTORY" );
   }
   if ( request.getParameter( "createbusiness" ) != null )
   {
      Person businessEntity = new Person( dbData, -1);
      businessEntity.deepPopulate(false);
      businessEntity.setRecordType( Person.RECORDTYPE_BUSINESS_ORG );

      EntityGroup businessEG = new EntityGroup( dbData, EntityGroup.TYPE_BUSINESS, -1);
      businessEG.setType( EntityGroup.TYPE_BUSINESS);
      businessEG.setName( "** new business **" );
      businessEG.createOrUpdateRecord( "ENTITYGROUP", false ); // create a entity group for this business
      int businessEGId = businessEG.getGroupNum();

      businessEntity.setOwnerId( businessEGId );
      businessEntity.setLastName( "** new business **" );
      businessEntity.setUpdateGroups( false );
      businessEntity.setSiteDefEntityType(  1 ); // just guessing at a default... it's really site-specific... but let's just say that value 1 should be default...
      businessEntity.createOrUpdateRecord( "PERSON" );

      GroupMemberMap map = new GroupMemberMap( dbData, businessEGId, EntityGroup.TYPE_BUSINESS, GroupMemberMap.MEMBERROLE_BUSINESS_RECORD, true,true );
      map.setMemberId( businessEntity.getPersonId() );
      map.setMemberType ( Person.RECORDTYPE_BUSINESS_ORG );
      map.createOrUpdateRecord( "GROUPMEMBERMAP" );
      new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "Create New Business", "ID=" + businessEntity.getPersonId(), "HISTORY" );

      // new business was created above... now need to add it as a member of this contact
      map = new GroupMemberMap( dbData, aContact.getId(), Person.RECORDTYPE_PERSON, businessEntity.getPersonId() );
      map.createOrUpdateRecord( "GROUPMEMBERMAP" );
      new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "New Business Added to Contact", "ID=" + businessEntity.getPersonId(), "HISTORY" );
   }
   if ( request.getParameter( "newContact" ) != null )
   {
     // db record for the new person should have been created above in contactinfo_incl based on cisaction=submit.  person object should still be addressable here
     // just map it to the contact now
      GroupMemberMap map = new GroupMemberMap( dbData, aContact.getId(), Person.RECORDTYPE_PERSON, aPerson.getPersonId() );
      map.createOrUpdateRecord( "GROUPMEMBERMAP" );
      new History( dbData, currUser.getUserName(), ObjectClassID.CONTACT, aContact.getId(), History.TYPE_RECORD_UPDATE, "New person created and added to this contact", "ID=" + map.getMemberId() + " " + aPerson.getName(), "HISTORY" );
   }
%>

<% if ( !site.equals( "wgbe" ))
   {
%>
      <h3>People</h3>
<%
   }
   else
   {
%>
      <h3>Businesses / People</h3>
<%
   }
%>

      <form action="<%=self.getJspName()%>" method="post">
      <table>
        <tr>
          <th>Primary</th>
          <th>Name</th>
          <th>Address</th>
        </tr>
<%
      { //scoping

         if ( request.getParameter( "cloneAddress" ) != null )
         {
            PersonList personList = new PersonList( dbData, -1, aContact.getId(), true );
            session.setAttribute( "personListQueryResults", personList ); // store for use in printing labels

            for ( int j= 0; j < personList.getRecordList().length; j++ )
            {
               aPerson = (Person) personList.getRecordList()[j];

               GroupMemberMap map = new GroupMemberMap( dbData, aContact.getId(), Person.RECORDTYPE_PERSON, aPerson.getPersonId(), true );

               if ( map.getPrimaryMember() > 0 )
               {
                   int cloneTargetPersonId = jspUtils.getIntParm( "personId" );
                   Address address = new Address( dbData, 0, -1, aPerson.getPersonId() );
                   Address cAddress = new Address( dbData, 0, -1, cloneTargetPersonId );
                   dbData.getLog().logEvent( "----------- cloning address" );
                   cAddress.setAddressLine1( address.getAddressLine1() );
                   cAddress.setAddressLine2( address.getAddressLine2() );
                   cAddress.setCity( address.getCity());
                   cAddress.setState( address.getState());
                   cAddress.setPostalCode( address.getPostalCode());
                   cAddress.createOrUpdateRecord( "ADDRESS" );
                   new History( dbData, currUser.getUserName(), ObjectClassID.PERSON, cloneTargetPersonId, History.TYPE_RECORD_UPDATE, "Cloned address from contact primary","From ID="+aPerson.getPersonId(), "HISTORY" );
               }
            }
         }

         int row=0;
         PersonList personList = new PersonList( dbData, -1, aContact.getId(), true );
         session.setAttribute( "personListQueryResults", personList ); // store for use in printing labels

         for ( int j= 0; j < personList.getRecordList().length; j++ )
         {
            aPerson = (Person) personList.getRecordList()[j];

            GroupMemberMap map = new GroupMemberMap( dbData, aContact.getId(), Person.RECORDTYPE_PERSON, aPerson.getPersonId(), true );


               String rowClass = "row1";
               if ( row++ % 2 != 0 ) rowClass="row0";
      %>
              <tr class=<%=rowClass%>>
                <td>
                   <input type=radio <% if (map.getPrimaryMember() > 0)   out.print(" CHECKED " );%> id=primary name=primary value=<%=aPerson.getPersonId()%> >
                </td>
                <td>
                   <%=aPerson.getFirstName() + " " + aPerson.getLastName()%>
                </td>
                <td>
                   <%=aPerson.getAddress().toHTML()%>
                </td>
                <td>
<%                if ( map.getMemberRole() == GroupMemberMap.MEMBERROLE_FAMILY_HUSBAND ) out.print( "Groom" );
                  else if ( map.getMemberRole() == GroupMemberMap.MEMBERROLE_GROOM ) out.print( "Groom" );
                  else if ( map.getMemberRole() == GroupMemberMap.MEMBERROLE_FAMILY_WIFE ) out.print( "Bride" );
                  else if ( map.getMemberRole() == GroupMemberMap.MEMBERROLE_BRIDE ) out.print( "Bride" );
                  else out.print( "&nbsp;" );
%>
                </td>

                <td>
<%                 if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON )
                   {
                      String cis2Context = "cis";
                      if ( site.equals( "wgbe" ) ) cis2Context = "cis2";
%>
                         <a href="/<%=cis2Context%>/jsp/user/personentry.jsp?personId=<%=aPerson.getPersonId()%>&formAction=<%=self.getJspName()%>&varName=contactId&varValue=<%=aContact.getId()%>&contactcontainer=<%=aContact.getId()%>">
<%
                   }
                   else if ( aPerson.getRecordType() == Person.RECORDTYPE_BUSINESS_ORG )
                   {
%>
                      <a href="/cis/jsp/user/businessentry.jsp?businessEGId=<%=aPerson.getOwnerId()%>">
<%
                   }
%>
                      <img src="/images/b_edit.png">
                   </a>
<%                 if ( request.isUserInRole( "CISOperator" ))
                   {
%>
                      <a onClick="return(validateRemove('<%=aPerson.getFirstName()+ " " + aPerson.getLastName()%>'))"
                         href="<%=self.getJspName()%>?personId=<%=aPerson.getPersonId()%>&contactId=<%=aContact.getId()%>&remove=true"><img src="/images/b_drop.png"></a>

<%
                      if ( request.isUserInRole( "IDManagerAdministrator" ))
                      {
                         if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON )
                         {
                             Users userId = new Users( dbData, Person.OWNERTYPE_CLIENT, aPerson.getPersonId() );
                             if (userId.isRecordFound() )
                             {
%>
                                <a class=smalltextlink href=/idmanager/jsp/administrator/modifyuser.jsp?userName=<%=userId.getUserName()%>><img width=16px src="/images/key.png"> </a>
<%
                             }
                             else
                             {
%>
                                <a class=smalltextlink href=/idmanager/jsp/administrator/createuser.jsp?ownerId=<%=aPerson.getPersonId()%>&ownerType=<%=Person.OWNERTYPE_CLIENT%>><img width=16px src="/images/newKey.png"></a>
<%
                             }
                         }
                      }
%>
<%                    if ( map.getPrimaryMember() == 0 ) // not primary
                      {
%>
                         <a onClick="return(validateCloneAddress('<%=aPerson.getFirstName()+ " " + aPerson.getLastName()%>'))"
                            href="<%=self.getJspName()%>?personId=<%=aPerson.getPersonId()%>&contactId=<%=aContact.getId()%>&cloneAddress=true"><img width=16 src="/images/clone.png"></a>
<%
                      }
                   }
%>
                </td>
              </tr>
<%
         }
      }
%>
       </table>
<% if ( !site.equals( "wgbe" ))
   {
%>
       <div style="width:150px; float:right">
          <font size=-1><b>Note:</b> Please do not change maiden name to married name.</font>
       </div>
<% } %>

       <img style="margin-left:10px" src="/images/arrow_ltr.png"><input type=hidden name="contactId" value=<%=aContact.getId()%>>
       <button type=submit id=update name=update>Update</button>
    </form>
    <div id="clear"></div>


<%if ( request.isUserInRole( "CISOperator" ))
  {
     String entityTypeStr = "Person";
     if ( site.equals( "wgbe" )) entityTypeStr = "Business";
%>
    <form name="form1" action="<%=self.getJspName()%>">
           <table>
             <tr>
               <td>&nbsp;&nbsp; &nbsp; &nbsp;</td>
               <td>
                     <b>Add <%=entityTypeStr%> to this Contact</b>
<%
                       if ( !site.equals( "wgbe" ))
                       {
%>
                          <a href="/cis/jsp/user/personentry.jsp?formInstanceId=<%=formInstanceId%>&amp;personId=-1&block1=true&amp;formAction=<%=self.getJspName()%>&amp;varName=contactId&amp;varValue=<%=aContact.getId()%>&amp;varName3=newContact&amp;varValue3=true">
<%
                       }
                       else
                       {
%>
                          <a href="<%=self.getJspName()%>?formInstanceId=<%=formInstanceId%>&amp;contactId=<%=aContact.getId()%>&amp;createbusiness=true">
<%
                       }
%>
                             <br>[Create New <%=entityTypeStr%> ]
                          </a>

                     <% if ( request.getParameter( "actioncontactsearch" ) != null ) { %>
                          <br><select name=contactselect>
                           <% for ( int i = 0; i < personListSearchResults.getRecordList().length; i++ ) { %>
                              <% aPerson = (Person) personListSearchResults.getRecordList()[i]; %>
                              <option value=<%=aPerson.getPersonId()%>><%=aPerson.getLastName()%>, <%=aPerson.getFirstName()%></option>
                           <% } %>
                           </select>
                           <input type=submit id=abc name=selectcontact value=Select>
                           <input type=submit id=abc name=cancel value=Cancel>


                     <% } else if ( request.getParameter( "contactsearch" ) == null ) { %>
                            <a href="<%=self.getJspName()%>?formInstanceId=<%=formInstanceId%>&amp;contactId=<%=aContact.getId()%>&amp;contactsearch=true">
                               <br>[Search For <%=entityTypeStr%> ]
                            </a>

                     <% } else { %>
                             <br>Search:
                             <input id=xzy name=searchcriteria value="">
                             <input type=submit id="abc" name="actioncontactsearch" value="Search">
                             <input type=submit id="abc1" name="cancel" value="Cancel">
                     <% } %>
               </td>
             </tr>
          </table>
         <input type=hidden name=contactId value=<%=aContact.getId()%>>
    </form>

   <form action=/cis/jsp/operator/prepLabelFormat.jsp>
      <input type=Submit name=submit id=submit value="Print Mailing Labels">
   </form>
<%
  }
%>
<hr>
