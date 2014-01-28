<%
   String formInstanceId = new Integer(((new Date() ).toString() + pageTitle).hashCode()).toString();
   String lastFormInstanceId = (String) session.getValue( "lastFormInstanceId" );
   if ( lastFormInstanceId == null ) lastFormInstanceId = "";

   String submittedFormInstanceId = jspUtils.getParameter( "formInstanceId" );
   if ( submittedFormInstanceId == null ) submittedFormInstanceId = "";

   boolean newFormSubmit = !submittedFormInstanceId.equals(lastFormInstanceId);
   System.out.println( lastFormInstanceId + " ?? " + submittedFormInstanceId + "  " + newFormSubmit );

   if (newFormSubmit)  session.putValue( "lastFormInstanceId" , submittedFormInstanceId );
%>
