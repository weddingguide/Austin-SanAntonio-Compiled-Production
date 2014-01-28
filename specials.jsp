<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/specials_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>


<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header>

   <div id="content" class="special">     
	  <div class="special-info">
         <%@ include file="incl/specials_specialsInfo_incl.jsp" %>
      </div>
      <div class="special-container">
         <%@ include file="incl/specials_specialContainer_incl.jsp" %>  
      </div>
   </div>
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div>
<%@ include file="incl/PageFooter_incl.jsp" %>
