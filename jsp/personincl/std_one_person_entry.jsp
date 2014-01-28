   <% String formAction = request.getParameter( "formAction" );
      if ( formAction == null ) formAction = "contactlist.jsp";
   %>

   <form name="form1" method="post" action="<%=formAction%>" onsubmit="selectAllEntries(document.form1.listRight);">
      <input type=hidden name=formAction value=<%=formAction%>>
          <%
             boolean search = false;
             boolean forceReadWrite = false;


             String addressLabel;
             String addressType;
             Address address;

             String emailLabel;
             String emailType;
             Email email;

             String phoneLabel;
             String phoneType;
             Phone phone;

             String personLabel = "_" + pageGroupPrefix;
             String personType  = entityType;
          %>
     <%@ include file="std_person_entry_block.jsp" %>


     <% if ( request.getParameter( "clone" ) != null ) personId = -1; %>
     <p>
       <input type=hidden name=formInstanceId value='<%= formInstanceId %>' >
       <input name="personId" type="hidden" value=<%=personId%>>
       <input name="<%= request.getParameter( "varName" ) %>" type="hidden" value="<%= request.getParameter( "varValue" )%>">
       <input name="<%= request.getParameter( "varName2" ) %>" type="hidden" value="<%= request.getParameter( "varValue2" )%>">
       <input name="<%= request.getParameter( "varName3" ) %>" type="hidden" value="<%= request.getParameter( "varValue3" )%>">
       <input name="<%= request.getParameter( "varName4" ) %>" type="hidden" value="<%= request.getParameter( "varValue4" )%>">
       <input name="<%= request.getParameter( "varName5" ) %>" type="hidden" value="<%= request.getParameter( "varValue5" )%>">

    <% if ( formAction.equals( "contactlist.jsp" ) )
       {
          // if going to a list after updating/creating... want to be sure and regenerate the query 01/30/07
    %>
          <input type=hidden name=firstentry value=true >
    <% } else { %>
       <input type=hidden name=refreshquery value=true >
    <% } %>


     <% if ( !readOnly ) { %>
       <input name="cisaction" type="submit" value="Submit">
     <% } else { %>
       <input name="action" type="submit" value="Return">
     <% } %>

     </p>

   </form>
