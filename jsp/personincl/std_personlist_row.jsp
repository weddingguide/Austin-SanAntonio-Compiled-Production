                     <% String rowClass = "row1";
                        if ( i % 2 != 0 ) rowClass="row0";
                     %>
                        <tr class=<%=rowClass%>>
                           <% Person aPerson = (Person)aPersonList.getRecordList()[i]; %>

              <% if ( request.isUserInRole( "CISOperator" )) { %>
                           <td>
                              <input type=checkbox name=entityselect id=entityselect value="<%=aPerson.getPersonId()%>">
                           </td>

                           <% if ( statusList.getRecordList().length > 0 ) { %>
                                 <td><%=statusText[ aPerson.getSiteDefEntityType() ]%></td>
                           <%  } %>
              <% } %>



                           <td>
              <% if ( request.isUserInRole( "CISOperator" )) { %>
                    <% if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON ) { %>
                               <a class=normallink href=<%=pageGroupPrefix%>entry.jsp?personId=<%= aPerson.getPersonId() %>&formAction=/cis//jsp/operator/personlist.jsp>

                                  <%= aPerson.getLastName() + ", " + aPerson.getFirstName() %>
                               <a>
                    <% } else { %>
                               <a class=normallink href=businessentry.jsp?businessEGId=<%= aPerson.getOwnerId() %>>
                                  <%= aPerson.getLastName() %>
                               <a>
                    <% } %>
              <% } else if ( !request.isUserInRole( "CISViewer" )) { //  NOT Operator and NOT Viewer... just valid for user's own stuff %>
                    <% if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON ) { %>
                               <a class=normallink href=<%=pageGroupPrefix%>entry.jsp?personId=<%= aPerson.getPersonId() %>>
                                  <%= aPerson.getLastName() + ", " + aPerson.getFirstName() %>
                               <a>
                    <% } else { %>
                               <a class=normallink href=businessentry.jsp?businessEGId=<%= aPerson.getOwnerId() %>>
                                  <%= aPerson.getLastName() %>
                               <a>
                    <% } %>
              <% } else { %>
                    <% if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON ) { // this should be VIEWER only %>
                               <a class=normallink href=<%=pageGroupPrefix%>view.jsp?personId=<%= aPerson.getPersonId() %>>
                                  <%= aPerson.getLastName() + ", " + aPerson.getFirstName() %>
                               <a>
                    <% } else { %>
                               <a class=normallink href=businessview.jsp?businessEGId=<%= aPerson.getOwnerId() %>>
                                  <%= aPerson.getLastName() %>
                               <a>
                    <% } %>
              <% } %>
                           </td>
                           <td>
                                <%= aPerson.getAddress().getAddressLine1() %>&nbsp;
                                <% if (!aPerson.getAddress().getAddressLine2().equals("")) { %>
                                       <br><%= aPerson.getAddress().getAddressLine2() %>&nbsp;
                                    <% } %>
                                <br><%= aPerson.getAddress().getCity() %>, <%= aPerson.getAddress().getState() %>&nbsp;
                                <br><%= aPerson.getAddress().getPostalCode() %>&nbsp;
                           </td>
                           <td>
                           <%
                                boolean first = true;
                                for ( int jj = 0; jj < customText.getInstanceCount(recordType, EntityCustomText.OBJECTTYPE_PHONE); jj++ )
                                {
                                   String shortText = customText.text [recordType]  [EntityCustomText.OBJECTTYPE_PHONE]  [jj]  [EntityCustomText.TEXTTYPE_SHORT];
                                   if( !aPerson.getPhone(jj).getPhoneNumber().equals(""))
                                   {
                                      if ( !first) out.print("<br>");
                                      first = false;
                           %>
                                      <b><i><font size=-2>(<%=shortText%>)</font></i></b>
                                      <%= aPerson.getPhone(jj).getPhoneNumber() %>&nbsp;
                                <% } %>
                             <% } %>
                           </td>
                           <td>
                               <%  String emailName = aPerson.getFirstName() + " " + aPerson.getLastName();
                                   emailName = emailName.replaceAll( "\"", "");
                                   emailName = emailName.replaceAll( ";", "");
                                   emailName = emailName.replaceAll( ",", "");

                                   first = true;
                                   for ( int jj = 0; jj < customText.getInstanceCount(recordType, EntityCustomText.OBJECTTYPE_EMAIL); jj++ )
                                   {
                                      String shortText = customText.text [recordType]  [EntityCustomText.OBJECTTYPE_EMAIL]  [jj]  [EntityCustomText.TEXTTYPE_SHORT];
                                      if( !aPerson.getEmail(jj).getEmailAddress().equals(""))
                                      {
                                         if ( !first) out.print("<br>");
                                         first = false;
                              %>
                                         <b><i><font size=-2>(<%=shortText%>)</font></i></b>
                                         <a href="mailto:<%=emailName%> <<%=aPerson.getEmail(jj).getEmailAddress() %>>"><%=aPerson.getEmail(jj).getEmailAddress() %></a>
                                   <% } %>
                                <% } %>
                          </td>
                           <td><ul>
              <% if ( request.isUserInRole( "CISOperator" )) { %>
                    <% if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON ) { %>
                                  <li>
                                    <font size=-1>
                                      <a class=normallink href=<%=pageGroupPrefix%>entry.jsp?personId=<%= aPerson.getPersonId() %>&amp;clone=true> Clone Record </a>
                                    </font>
                                  </li>
                    <% } %>
                                  <li>
                                    <font size=-1>
                                       <a class=normallink href=<%=pageGroupPrefix%>list.jsp?personId=<%= aPerson.getPersonId() %>&amp;cisaction=Remove&amp;refreshquery=true&amp;formInstanceId=<%=formInstanceId%> onClick='return(validateRemove());'>Remove </a>
                                    </font>
                                  </li>
                                  <li>
                                    <font size=-1>
                                       <a class=normallink href=contactlist.jsp?personId=<%= aPerson.getPersonId() %>>Contact Membership</a>
                                    </font>
                                  </li>
              <% } %>

              <% if ( request.isUserInRole( "IDManagerAdministrator" )) { %>
                    <% if ( aPerson.getRecordType() == Person.RECORDTYPE_PERSON ) { %>
                                  <li>
                                    <font size=-1>
                                       <a class=normallink href=/idmanager/jsp/administrator/createuser.jsp?ownerId=<%= aPerson.getPersonId() %>&ownerType=<%=Person.OWNERTYPE_CLIENT%>>Create UserId </a>
                                    </font>
                                  </li>
                    <% } %>
              <% } %>
              <% if ( request.isUserInRole( "GeneralLedgerOwner" )) { %>
                                        <li>
                                          <font size=-1>
                                             <a class=normallink href=/gl/jsp/user/userinvoicelist.jsp?clientId=<%= aPerson.getPersonId() %>>View Invoices<a>
                                          </font>
                                        </li>
              <% } %>
              <% if ( request.isUserInRole( "OrderOperator" )) { %>
                                        <li>
                                          <font size=-1>
                                             <a class=normallink href=/order/jsp/guest/catalog.jsp?clientId=<%= aPerson.getPersonId() %>&clientType=<%=Person.OWNERTYPE_CLIENT%>&productGroupId=2&newcart=true>Place Order</a>
                                          </font>
                                        </li>
              <% } %>
                              &nbsp;
                           </td>
                        </tr>
