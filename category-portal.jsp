<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/categoryPortal_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>


<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header>

   <div id="content" class="portal">     
      <div class="portal-info">
         <%@ include file="incl/portal_categoryInfo_incl.jsp" %>  
      </div>
      <div class="portal-siteTools">
         <%@ include file="incl/portal_siteTools_incl.jsp" %>  
      </div>
      <div class="portal-blog">
          <%@ include file="incl/portal_blog_incl.jsp" %>     
      </div>
      <br class="clearfix" />
      <div class="portal-featuredVendors">
         <%@ include file="incl/portal_featuredVendors_incl.jsp" %>
      </div>
   </div>
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div>
<%@ include file="incl/PageFooter_incl.jsp" %>
