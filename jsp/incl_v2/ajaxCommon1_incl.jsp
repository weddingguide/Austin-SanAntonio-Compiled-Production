<%
   int projectId = jspUtils.getIntParm( "projectId" );

   Project aProject = new Project( dbData, projectId );

   CoupleGroupInfo coupleInfo = new CoupleGroupInfo( dbData, ObjectClassID.COUPLE, aProject.getContactId() ); // if contacttype != couple, this object won't be used, just initialize here if present

%>
