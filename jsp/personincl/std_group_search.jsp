   <% String formAction1 = pageGroupPrefix +"list.jsp";
      if (person.getRecordType() == Person.RECORDTYPE_BUSINESS_ORG ) formAction1 = "businesslist.jsp";
    %>

   <form name="form4" method="post" action=<%=formAction1%>>
      <h3>&nbsp;</h3>
      <h4>Search by Group Membership:</h4>
      <table>
        <tr>
          <td>
              <select name=groupNum >
              <%
                 EntityGroupList groupList = new EntityGroupList( dbData, EntityGroup.TYPE_GENERAL , person.getRecordType() );
                 for ( int i = 0; i < groupList.getRecordList().length; i++ )
                 {
                     EntityGroup aGroup = (EntityGroup)groupList.getRecordList()[i];
              %>
                     <option value=<%=aGroup.getGroupNum()%>><%=aGroup.getName()%></option>
             <% } %>
             </select>
           </td>
           <td>
               <%@ include file="siteDefEntityType_search_formcontents.jsp" %>
           </td>
        </tr>
      </table>
     <%@ include file="entriesperpage.jsp" %>
     <input name="groupType" type="hidden" value="0">
     <input name="GroupList" type="submit" value="Show Group Membership">

     <% if (person.getRecordType() == Person.RECORDTYPE_BUSINESS_ORG ) { %>
        <input name=business type="hidden" value="*">
     <% } %>

  </form>
