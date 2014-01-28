<% if ( request.getParameter( "TakeProjectOwnershipSelect" ) != null )
   {
      int projectId = jspUtils.getIntParm( "TakeProjectOwnershipSelect" );
      Project aProject = new Project( dbData, projectId );
      aProject.setContactType( ObjectClassID.CONTACT );
      aProject.setContactId( aContact.getId() );
      aProject.createOrUpdateRecord( "PROJECT" );
   }
%>
      <h3>Projects</h3>
      <ul>
<%
         ProjectList projectList = new ProjectList( dbData, ObjectClassID.CONTACT, aContact.getId() );
         for (int i = 0; i < projectList.getRecordList().length; i++ )
         {
            Project aProject = (Project)projectList.getRecordList()[i];
            pStatus1 = new ProjectStatus( dbData, aProject.getStatus() );
%>
            <li><a href="/projectmanager/jsp/user/project.jsp?projectId=<%=aProject.getId()%>"><%=aProject.getName()%></a> - <%=ProjectStatus.getHTML( dbData, aProject ) %>
<%
         }
%>
      </ul>
      <% if (request.isUserInRole( "CISOperator" ) )
         {
      %>
             <form name=form1 action="<%=self.getJspName()%>" method="post">
                   <input type=hidden name="contactId" value=<%=aContact.getId()%>>

<%                   if ( request.getParameter( "TakeProjectOwnershipList" ) != null )
                     {
%>
                           <select name="TakeProjectOwnershipSelect" >

                                  <% projectList = new ProjectList( dbData );
                                     for ( int i = 0; i < projectList.getRecordList().length; i++ )
                                     {
                                        Project aProject = (Project)projectList.getRecordList()[i];
                                  %>
                                        <option value=<%=aProject.getId()%> ><%=aProject.getName()%> - <%=ProjectStatus.getHTML( dbData, aProject ) %></option>
                                  <% }
                                  %>
                           </select>
<%                    }
          }
%>

                   <input type=submit name=TakeProjectOwnershipList value="Take Ownership of Other Projects">

             </form>
<hr>
