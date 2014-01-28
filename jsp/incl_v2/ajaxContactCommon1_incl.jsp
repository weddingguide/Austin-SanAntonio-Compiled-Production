<%
   int contactId = jspUtils.getIntParm( "contactId" );

   Contact aContact = new Contact( dbData, contactId );

%>
