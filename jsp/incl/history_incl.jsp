
                 <h3>History:</h3>
                     Add Note: <input type=text name=notetext size=60>
                    <p>&nbsp;
                    <table border=1>
                       <tr>
                         <th>Date</th>
                         <th>ID</th>
                         <th>OwnerId</th>
                         <th>&nbsp;</th>
                         <th>Type</th>
                         <th>Text</th>
                         <th>&nbsp;</th>
                         <th>Originator ID</th>
                       </tr>
                   <% for ( int i = 0; i < historyList.getRecordList().length; i++ )
                      {
                         History aNote = (History)historyList.getRecordList()[i];
                         Person noteOwner = new Person( dbData, aNote.getOwnerId() );
                   %>
                       <tr>
                         <td><%=aNote.getDate()%></td>
                         <td><%=aNote.getEventId()%></td>
                         <td><%=aNote.getOwnerId()%></td>
                         <td><%=noteOwner.getFirstName() + " " + noteOwner.getLastName()%></td>
                         <td><%=aNote.getStrType()%></td>
                         <td><%=aNote.getDescription()%></td>
                         <td><%=aNote.getComment()%></td>
                         <td><%=aNote.getOriginator()%></td>
                       </tr>
                   <% } %>
                   </table>
