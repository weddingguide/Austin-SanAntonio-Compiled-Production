<script>
   function getWorkItemExpandCollapse( elementId, image, workItemId )
   {
      var busyIcon = document.getElementById( "busy"+workItemId );
      busyIcon.style.display = "block";

      expandIt( elementId, image );

      var ajaxRequest = getAjaxRequestObject();

      var workItemContainer = document.getElementById( elementId );
      ajaxRequest.onreadystatechange = function() { displayWorkItem( ajaxRequest, workItemContainer, busyIcon ); } ;

      ajaxRequest.open("GET", "/itemtrack/jsp/user/ajaxGetWorkItem.jsp?workItemId="+workItemId, true);
      ajaxRequest.send(null);
   }
   function displayWorkItem( ajaxRequest, workItemContainer, busyIcon )
   {
      if(ajaxRequest.readyState == 4)
      {
         workItemContainer.innerHTML = ajaxRequest.responseText;
         busyIcon.style.display="none";
      }
   }

function ajaxWorkItemUpdate(fieldName, dType, workItemId, workItemContainerId )
{
    var busyIcon = document.getElementById( "busy"+workItemId );
    busyIcon.style.display = "block";


    var ajaxRequest = getAjaxRequestObject();
    var dataValue = "";
    if (  dType == 'date' )
    {
       var monthObj = document.getElementById( fieldName+"Month");
       var dayObj   = document.getElementById( fieldName+"Day");
       var yearObj  = document.getElementById( fieldName+"Year");

       theDay    = (dayObj.selectedIndex)+1;
       theMonth  = (monthObj.selectedIndex)+1;
       theYearNdx = yearObj.selectedIndex;
       theYear = yearObj.options[theYearNdx].value;

       dataValue = theYear + '-' + right('0'+theMonth,2) + '-' + right('0'+theDay, 2);
    }
    else
    {
       dataValue = (document.getElementById( fieldName)).value;
    }
    dataValue = encodeURIComponent( dataValue );

    var workItemContainer = document.getElementById( workItemContainerId );
    ajaxRequest.onreadystatechange = function() { displayWorkItem( ajaxRequest, workItemContainer, busyIcon );} ;

    var params = "update="+fieldName+"&dataValue="+dataValue+"&workItemId="+workItemId;

    ajaxRequest.open("POST", "/itemtrack/jsp/user/ajaxGetWorkItem.jsp", true);
    try
    {
       ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
       ajaxRequest.setRequestHeader("Content-length", params.length);
       ajaxRequest.setRequestHeader("Connection", "close");
    }
    catch( e )
    {
       alert( e );
    }
    ajaxRequest.send(params);

}

   function getAjaxRequestObject()
   {
      var ajaxRequest;
      try
      {
         ajaxRequest = new XMLHttpRequest();
      }
      catch (e)
      {
         try
         {
            ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
         }
         catch (e)
         {
            try
            {
               ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e)
            {
               alert("Browser not supported for attribute updates");
               return false;
            }
         }
      }
      return( ajaxRequest );
   }
</script>

<div class="mediumWidthContainer">
   <h1 class="fancy">Work Item List</h1>
    <div class="shadowbox">

<%   WorkItemView workItemView = (WorkItemView)session.getAttribute( "workItemView" );
    if (workItemView == null )
    {
       workItemView = new WorkItemView( request );
       session.setAttribute( "workItemView", workItemView );
    }

    Person user = (Person) currUser.getOwner();

    if ( request.getParameter( "newWorkItem" ) != null )
    {
       WorkItem wi = new WorkItem( dbData, -1 );
       wi.setOriginator( user.getPersonId() );
       wi.setStatus( WorkItem.STATUS_NEW_XFER );
       wi.setOwnerId( user.getPersonId() );
       wi.setOwnerType( WorkItem.OWNERTYPE_PERSON );
       wi.setSeverity( WorkItem.SEVERITY_QUEUED_ITEM );
       wi.createRecord( "WORKITEM" );
    }
%>
     <table width="100%">
       <tr>
         <td width="50%">
           <form action="<%=self.getJspName()%>" method="post">
              <input type="submit" name="submit" value="Refresh">
           </form>
         </td>
         <td style="text-align:right">
           <form action="<%=self.getJspName()%>" method="post">
              <input type="hidden" name="newWorkItem" value="true">
              <input type="submit" name="submit" value="New WorkItem">
           </form>
         </td>
      </table>

  <table border=0>
    <tr>
       <th>-----&nbsp;</th>
       <th>&nbsp;</th>
       <% if ( workItemView.showSeverity ) { %><th>Severity</th><% } %>
       <% if ( workItemView.showDescription) { %><th>Description</th><% } %>
       <% if ( workItemView.showDueDate) { %><th>Origin/Due</th><% } %>
       <% if ( workItemView.showStatus    ) { %><th>Status</th><% } %>
       <% if ( workItemView.showOwnerId   ) { %><th>Assigned</th><% } %>
       <% if ( workItemView.showOriginator ) { %><th>Originator</th><% } %>
    </tr>

  <%
     WorkItemList workItemList = new WorkItemList( dbData, user.getPersonId(), request.isUserInRole( "ItemTrackAdministrator") );

     for (int i = 0; i < workItemList.getRecordList().length; i++ )
     {
        WorkItem workItem = (WorkItem) workItemList.getRecordList()[i];
        workItem.deepPopulate();

        String rowClass = "row1";
        if ( i % 2 != 0 ) rowClass="row0";

        String ownerClass = "";
        if ( user.getPersonId() == workItem.getOwnerId() ) ownerClass = "standard";
  %>
      <tr class=<%=rowClass%> >

       <td><img id="busy<%=workItem.getId()%>" src="/images/ajax-loader.gif" style="display:none"></td>
       <td><img src="/images/plus.gif" id="workitem<%=i%>Img" onClick="getWorkItemExpandCollapse('workitem<%=workItem.getId()%>', this, '<%=workItem.getId()%>');"></td>

       <% if ( workItemView.showSeverity ) {   %><td class="<%=workItem.severityClass[ workItem.getSeverity() ] %>"><%=workItem.severityText[ workItem.getSeverity() ] %></td><% } %>
       <% if ( workItemView.showDescription) { %><td class="widefault"><%=workItem.getDescription()%></td><% } %>
       <% if ( workItemView.showDueDate) {     %><td><%=workItem.getDueDate()%></td><% } %>
       <% if ( workItemView.showStatus    ) {  %><td class="<%=workItem.statusClass[ workItem.getStatus() ] %>"><%=workItem.statusText[ workItem.getStatus() ] %></td><% } %>
       <% if ( workItemView.showOwnerId   ) {  %><td class=<%=ownerClass%>><%=workItem.getOwnerName() %></td><% } %>
       <% if ( workItemView.showOriginator ) { %><td><%=workItem.getOriginatorName()%></td><% } %>
     </tr>
     <tr>
       <td colspan=8>
         <div id=workitem<%=workItem.getId()%> style="display:none; border:2px solid black">
            [Loading work item...]
         </div>
       </td>
     </tr>
  <% } %>
  </table>


  </div>
</div>
