   <form name="form_createdate" method="post" action="<%=pageGroupPrefix%>list.jsp">
   <% { %>
      <h3>&nbsp;</h3>
      <h4>Search by create date:</h4>
      Created since:
         <% Calendar cal = Calendar.getInstance(); %>
         <% int theYear = cal.get( Calendar.YEAR );  %>
         <% int theMonth = cal.get( Calendar.MONTH )+1; %>
         <% int theDay = cal.get( Calendar.DATE );  %>
         <% String datePrefix = "createDate"; %>
         <% String dateSuffix = ""; %>
         <% String setDaysFn = "setDaysSingle"; %>
         <% int theMinute = 0; %>
         <% int theAMPM = 0; %>
         <% int numDays; %>
         <% dateBeginYear = 2003; // dateEndYear will use default set in stdHeader %>
         <%@ include file="../datetimeincl/dateincl.jsp" %>
     <%@ include file="entriesperpage.jsp" %>
   <% } %>
     <input name="SearchByCreateDate" type="submit" id="Search" value="Search By Create Date">
  </form>
