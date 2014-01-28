<%
   if ( request.isUserInRole( "CISTracker" ))
   {
      String statusQueryString = "";
%>
<%@ include file="..\dataaccess\dataaccess1_incl.jsp" %>
<%
      jwmbosDataAccessCtrl.inclContacts                                 = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclIndividualContacts = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclByOpenWorkItems    = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.inclWorkItemCounts     = true;
      jwmbosDataAccessCtrl.contactDataAccessCtrl.title                  = "Open Work Items";
      jwmbosDataAccessCtrl.contactDataAccessCtrl.max                    = aLimit;

%>
<%@ include file="..\dataaccess\dataaccess2_incl.jsp" %>

      <div class="dashboardBox">
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
               <td>
                  <x:out select="$aContact/@nextEventDate"/>
               </td>
               <td>
                  <span class="hot">
                     <x:out select="$aContact/workItemClassCounts/workItemStatus[@class='hot']/@count"/>
                  </span>
               </td>
               <td>
                  <span class="warm">
                     <x:out select="$aContact/workItemClassCounts/workItemStatus[@class='warm']/@count"/>
                  </span>
               </td>
               <td>
                  <span class="complete">
                     <x:out select="$aContact/workItemClassCounts/workItemStatus[@class='complete']/@count"/>
                  </span>
               </td>
            </tr>
         </x:forEach>
         </table>
      </div>
<%
    }
%>
