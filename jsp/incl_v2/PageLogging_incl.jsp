<%
   dbData.getLog().setLogLevel(logLevel);


   dbData.getLog().logEvent( "======================== Page: " + pageTitle + " ==================== (" + userPerson.getFirstName() + " " + userPerson.getLastName() + ") ==============" );
   jspUtils.showFormData( request, dbData.getLog() );
   dbData.getLog().logEvent( "Last Form Instance Id: " + lastFormInstanceId + " -- Submitted Form Instance Id: " + submittedFormInstanceId );
%>
