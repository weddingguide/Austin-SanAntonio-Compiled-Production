<%{%>
 <% ProjectStatus pStatus = new ProjectStatus( dbData, aContact.getStatus() ); %>

 <select id='contactstatus' onChange="updateStatus( this, <%=aContact.getId()%>)">
    <option value=-1>-- Select New Status --</option>
    <% ProjectStatusList pStatusList = pStatus.getNextStateList();
    for ( int kk = 0; kk< pStatusList.getRecordList().length; kk++ )
       {
          ProjectStatus aProjectStatus = (ProjectStatus) pStatusList.getRecordList()[kk];
    %>
       <option value=<%=aProjectStatus.getId()%><% if (aContact.getStatus()==aProjectStatus.getId()) out.print( " SELECTED " );%>><%=aProjectStatus.getName()%></option>
    <%
       }
    %>
 </select>
<%}%>

