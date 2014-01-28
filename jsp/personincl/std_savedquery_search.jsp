   <form name="form2" method="post" action="<%=pageGroupPrefix%>list.jsp">
      <h3>&nbsp;</h3>
      <h4>Select from saved queries:</h4>
      <select name=savedquery >
      <%
         SavedQueryList queryList = new SavedQueryList( dbData, person.getRecordType() );
         for ( int i = 0; i < queryList.getRecordList().length; i++ )
         {
             SavedQuery aQuery = (SavedQuery)queryList.getRecordList()[i];
      %>
             <option value="<%=aQuery.getName()%>"><%=aQuery.getName()%></option>
     <% } %>
     </select>
     <%@ include file="entriesperpage.jsp" %>
     <input name="SavedSearch" type="submit" id="Search" value="Search Using Saved Query">
  </form>
