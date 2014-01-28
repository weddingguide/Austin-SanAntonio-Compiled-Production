                           <% Person aPerson = (Person)aPersonList.getRecordList()[i]; %>
                          <div  style="font-size: 10pt; padding:10px; position: absolute; left: <%=left%>in; top: <%=top%>in; height: 1in; width: 2.625in; border: none" >
                               <%= aPerson.getFirstName() %> <%= aPerson.getLastName() %>
                               <br><%= aPerson.getAddress().getAddressLine1() %>
                               <% if ( !aPerson.getAddress().getAddressLine2().equals("") ) { %>
                                 <br><%= aPerson.getAddress().getAddressLine2() %>
                               <% } %>
                               <br><%= aPerson.getAddress().getCity() %>, <%= aPerson.getAddress().getState() %> <%= aPerson.getAddress().getPostalCode() %>
                          </div>
