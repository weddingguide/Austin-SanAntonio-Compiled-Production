<% { %>
<%@ include file="..\dataaccess\dataaccess1_incl.jsp" %>
<%
   jwmbosDataAccessCtrl.inclWorkItems = true;
   jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclWorkItems      = true;

   if ( wiByOwner )
   {
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclByAssigned     = true;
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclByStatus       = false;
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.assignedId         = workItemOwnerId;
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclChildWorkItems = true;
   }
   else if ( wiByStatus )
   {
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclByStatus       = true;
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclByAssigned     = false;
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.status             = workItemStatus;
      jwmbosDataAccessCtrl.workItemDataAccessCtrl.inclChildWorkItems = true;
   }
%>
<%@ include file="..\dataaccess\dataaccess2_incl.jsp" %>

   <x:set var="workitemList" select="$doc/jwmbos/workItems" />
   <%@ include file="workitemlist_expandcollapse_incl.jsp" %>

      <div class="dashboardBox">
         <x:out select="$doc/jwmbos/workItems/@title"/>
         <h4 class="compact">
            <a href=/itemtrack/jsp/user/assignedworkitemlist.jsp?assignedId=<%=workItemOwnerId%>>
               Work Items
            </a>
         </h4>
            <table>
               <x:forEach select="$doc/jwmbos/workItems/workItem" var="thisWorkItem">
                  <tr class="<x:out select="$thisWorkItem/@rowClass"/>" id="wi<x:out select="$thisWorkItem/@id"/>tr">
                      <td colspan=3>
                         <x:if select="$thisWorkItem/workItems/@count>0">
                            <img style="border:2px solid red" src="/images/plus.gif" id="twisty<x:out select="$thisWorkItem/@id"/>" onClick="expandCollapse(<x:out select="$thisWorkItem/@id"/>, 1, <x:out select="$thisWorkItem/@byAssignedId"/>, 'true')" >
                         </x:if>
                         <%@ include file="myworkitemlist_row_incl.jsp" %>
                  </tr>
               </x:forEach>
            </table>
      </div>
<% } %>
