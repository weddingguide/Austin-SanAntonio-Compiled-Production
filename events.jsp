<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/events_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>


<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header>

   <div id="content" class="event">     
	  <div class="event-info">
         <%@ include file="incl/events_eventsInfo_incl.jsp" %>
      </div>
      <div class="event-container">
         <%@ include file="incl/events_eventContainer_incl.jsp" %>  
      </div>
   </div>
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div>
<%@ include file="incl/PageFooter_incl.jsp" %>
