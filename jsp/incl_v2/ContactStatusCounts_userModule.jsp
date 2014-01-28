<%
   if ( request.isUserInRole( "CISTracker" ))
   {
      String statusQueryString = "";
%>
<%@ include file="..\dataaccess\dataaccess1_incl.jsp" %>
<%
      jwmbosDataAccessCtrl.inclContacts                                 = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclIndividualContacts = false;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.separateLists          = true;

      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByStatus = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByFollowUp = false; // reset from prev use
      jwmbosDataAccessCtrl.contactDataAccessCtrl.statusArray = aStatusArray;
      for (int i = 0; i < aStatusArray.length; i++ )
      {
         if (i > 0) statusQueryString += "&";
         statusQueryString += "status="+aStatusArray[i];
      }
      jwmbosDataAccessCtrl.contactDataAccessCtrl.title = aTitle;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.max   = aLimit;

%>
<%@ include file="..\dataaccess\dataaccess2_incl.jsp" %>

      <div class="dashboardBox">
         <h4 class="compact">Status Counts</h4>
         <table>
         <x:forEach select="$doc/jwmbos/contactlists/contactlist" var="aContactList">
            <x:if select="$aContactList/@count!=0">
               <tr>
                  <td style="text-align:center">
                     <x:out select="$aContactList/@count"/>
                  </td>
                  <td style="text-align:center" class="followUpDue">
                     <x:out select="$aContactList/@followUpDue"/>
                  </td>
                  <td style="text-align:center" class="followUpPending">
                     <x:out select="$aContactList/@followUpPending"/>
                  </td>
                  <td>
                     <a href=/cis/jsp/operator/contactlist.jsp?status=<x:out select="$aContactList/@statusId"/>>
                        <x:out select="$aContactList/@title"/>
                     </a>
                  </td>
               </tr>
            </x:if>
         </x:forEach>
         </table>
         </a>
      </div>
<%
    }
%>
