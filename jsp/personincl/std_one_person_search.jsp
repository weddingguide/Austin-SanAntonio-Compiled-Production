   <% String formAction = pageGroupPrefix +"list.jsp";
      if (person.getRecordType() == Person.RECORDTYPE_BUSINESS_ORG ) formAction = "businesslist.jsp";

      if ( request.getParameter( "labels" ) != null ) formAction = "../../Avery5160.rtf" ;
   %>

   <form name="form1" method="post" action=<%=formAction%>>
     <input type=hidden name=pageGroupPrefix value=<%=pageGroupPrefix%> >
     <h3>&nbsp;</h3>
     <h4>Search by name, address, etc.</h4>
     <table>
       <tr>
         <td>
             <%@ include file="std_one_person_search_formcontents.jsp" %>
         </td>
         <td>
             <%@ include file="siteDefEntityType_search_formcontents.jsp" %>
         </td>
       <tr>
     </table>
     <p>
     <%@ include file="entriesperpage.jsp" %>
       <input name="Search" type="submit" id="Search" value="Search">
     </p>
     <% if (person.getRecordType() == Person.RECORDTYPE_BUSINESS_ORG ) { %>
        <input type=hidden name=business value=true>
     <% } %>
     <% if (request.getParameter("csv") != null) { %>
        <input type=hidden name=csv value=*>
     <% } %>

  </form>
