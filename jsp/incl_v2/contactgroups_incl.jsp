      <h3>Groups</h3>
          <form name=groupsForm action="<%=self.getJspName()%>" method="post" onsubmit="selectAllEntries(document.groupsForm.listRight);">
             <input type=hidden name=groupincl value=true>

          <% Person person = new Person(dbData);
             boolean readOnly = false;
             int groupType = 0;

             EntityGroupList currGroups = new EntityGroupList( dbData, aContact.getId(), true, true, true);
             EntityGroupList availGroups = new EntityGroupList( dbData, groupType, EntityGroup.ALLOWS_CONTACT, currGroups, groupUpdateType  );
             dbData.getLog().logEvent( "............return from getting groupLists" );
          %>
                <%@ include file="../personincl/genericgroup_incl.jsp" %>
                <input type=submit name=updategroups id=update value="Update">
                <input type=hidden name="contactId" value=<%=aContact.getId()%>>
          </form>
       <hr>
