<%
   if ( request.isUserInRole( "CISTracker" ))
   {
      String statusQueryString = "";
%>
<%@ include file="..\dataaccess\dataaccess1_incl.jsp" %>
<%
      jwmbosDataAccessCtrl.inclContacts                                 = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclIndividualContacts = true;

      if ( byStatus )
      {
         jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByStatus = true;
         jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByFollowUp = false; // reset from prev use
         jwmbosDataAccessCtrl.contactDataAccessCtrl.statusArray = aStatusArray;
         for (int i = 0; i < aStatusArray.length; i++ )
         {
            if (i > 0) statusQueryString += "&";
            statusQueryString += "status="+aStatusArray[i];
         }
      }
      if ( byFollowUp )
      {
         jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByStatus = false; // reset from prev use
         jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByFollowUp = true;
         jwmbosDataAccessCtrl.contactDataAccessCtrl.followUpStatus = followUpStatus;
         statusQueryString = "followup="+followUpStatus;
      }
      jwmbosDataAccessCtrl.contactDataAccessCtrl.title = aTitle;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.max   = aLimit;

%>
<%@ include file="..\dataaccess\dataaccess2_incl.jsp" %>

      <div class="dashboardBox">
         <a href=/cis/jsp/operator/contactlist.jsp?<%=statusQueryString%>>
            <h4 class="compact"><x:out select="$doc/jwmbos/contactlists/contactlist/@title"/></h4>
         </a>
         <table>
         <x:forEach select="$doc/jwmbos/contactlists/contactlist/contact" var="aContact">
            <tr>
               <td>
                  <a href="/cis/jsp/operator/managecontact.jsp?contactId=<x:out select="$aContact/@id"/>">
                     <x:out select="$aContact/@name"/>
                  </a>
               </td>
               <td class="<x:out select="$aContact/@trackingDateClass"/>" style="text-align:center">
                  <x:set var="htmltmp" select="string($aContact/@trackingDate)"/>
                  <c:out value="${htmltmp}" escapeXml="false"/>
               </td>
            </tr>
         </x:forEach>
         </table>
      </div>
<%
    }
%>
