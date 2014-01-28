
<script>
   <%@ include file="../javascript/sorttable.js" %>
</script>
                 <h3>History:</h3>
                     Add Note: <input type=text name=notetext size=60>
                     <input type=submit name=addnote value="Submit">
                    <p>&nbsp;
                    <table border=1 id=history>
                       <tr>
                         <th>Date</th>
                         <th>&nbsp;</th>
                         <th>Type</th>
                         <th>Text</th>
                         <th>Details</th>
                         <th>Originator ID</th>
                       </tr>
                   <% for ( int i = 0; i < historyList.getRecordList().length; i++ )
                      {
                         History aNote = (History)historyList.getRecordList()[i];
                         Person noteOwner = new Person( dbData, aNote.getOwnerId() );
                         if (( i >= historyLimit ) && ( i < historyList.getRecordList().length ))
                         {
                             session.setAttribute( "historyList", historyList );
                   %>
                             <tr>
                               <td><a href=/cis/jsp/operator/AllHistory.jsp?entityId=<%=entityId%>>More...</a>
                               <td>&nbsp;</td>
                               <td>&nbsp;</td>
                               <td>&nbsp;</td>
                               <td>&nbsp;</td>
                             </tr>
                   <%
                             break;
                         }
                   %>


                       <tr>
                         <td><%=aNote.getDate()%></td>
                         <td><%=noteOwner.getFirstName() + " " + noteOwner.getLastName()%></td>
                         <td><%=aNote.getStrType()%></td>
                         <td><%=aNote.getDescription()%></td>
                         <td><%=aNote.getComment()%></td>
                         <td><%=aNote.getOriginator()%></td>
                       </tr>
                   <% } %>
                   </table>
