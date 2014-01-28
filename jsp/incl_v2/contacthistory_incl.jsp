<h3>History</h3>
      <form action="<%=self.getJspName()%>" method="post">
         Add Note:
         <select name=eventType>
<%
         for (int ii=0; ii< History.types.length; ii++ )
         {
            if (History.type_userEntry[ii] )
            {
%>
               <option value="<%=ii%>"><%=History.types[ii]%></option>
<%
            }
         }
%>
         </select>
         <input type="text" name="notetext" size="60">
         <input type="hidden" name="contactId" value="<%=aContact.getId()%>">
         <input type="submit" name="submit" value="Add">
      </form>
      <% HistoryList historyList = new HistoryList( dbData, ObjectClassID.CONTACT, aContact.getId()); %>
      <%@ include file="history_incl.jsp" %>
<hr>
