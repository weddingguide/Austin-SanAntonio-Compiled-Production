<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/category_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>


<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header>

   <div id="content" class="category">     
      <div class="featuredVendors">
         <%@ include file="incl/category_featuredVendors_incl.jsp"%>
      </div>
      <div class="category-info">
         <%@ include file="incl/category_categoryInfo_incl.jsp" %>  
      </div>
      <div class="vendor-container">
         <%@ include file="incl/category_vendorList_incl.jsp" %>               
      </div>
   </div>
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div>
<%@ include file="incl/PageFooter_incl.jsp" %>
