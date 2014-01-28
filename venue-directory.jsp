<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/categoryDetails_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>


<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header>

   <div id="content" class="venue-directory">
      <div class="venueDirectory">
         <div class="vd-info">
            <%@ include file="incl/directory_directoryInfo_incl.jsp" %>
         </div>
         <div class="placeholder">
         <div class="vd-key">
            <%@ include file="incl/directory_directoryKey_incl.jsp" %>
         </div>
         </div>
         <div class="vd-container">
            <%@ include file="incl/directory_directoryContainer_incl.jsp" %>
         </div>
      </div>  
      <aside class="planningToolsNav">
         <%@ include file="incl/planningTools_sideNav_incl.jsp" %>
      </aside> 
   </div>
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div>
<%@ include file="incl/PageFooter_incl.jsp" %>
