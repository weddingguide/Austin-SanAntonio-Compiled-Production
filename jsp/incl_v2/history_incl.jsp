                    <table>
                       <tr>
                         <th>Date</th>
                         <th>Type</th>
                         <th>Text</th>
                         <th>&nbsp;</th>
                         <th>Originator ID</th>
                       </tr>
                   <% int row=0;
                      for ( int i = 0; i < historyList.getRecordList().length; i++ )
                      {
                         History aNote = (History)historyList.getRecordList()[i];
                         Person noteOwner = new Person( dbData, aNote.getOwnerId() );
                         String rowClass = "row1";
                         if ( row++ % 2 != 0 ) rowClass="row0";
                %>
                       <tr class=<%=rowClass%>>
                         <td><%=jspUtils.timeStamp(aNote.getDate())%></td>
                         <td>
                            <% if (( aNote.getEventType() == History.TYPE_SENT_EMAIL )
                                  || ( aNote.getEventType() == History.TYPE_RECEIVED_EMAIL ))
                               {
                            %>
                                <img src="/images/plus.gif" id="history<%=i%>Img" onClick="getEmailExpandCollapse('history<%=i%>', this, '<%=aNote.getReference()%>', <%=noteOwner.getPersonId()%>);">

                            <%
                               }
                            %>
                            <%=aNote.getStrType2()%>
                         </td>
                         <td><%=aNote.getDescription()%></td>
                         <td><%=aNote.getComment()%></td>
                         <td><%=aNote.getOriginator()%></td>
                       </tr>
                       <tr>
                         <td colspan=5>
                           <div id=history<%=i%> style="display:none; border:2px solid black">
                              [Loading message...]
                           </div>
                         </td>
                       </tr>
                   <% } %>
                   </table>
