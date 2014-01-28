<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/index_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>
<%@ include file="incl/sliderJs_incl.jsp" %>


<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header> 
   <div id="content">
      <%@ include file="incl/slider_incl.jsp" %>
      <div class="registration">
               <a href="register.jsp">
                  <img src="img/reg_banner.jpg" width="720" height="90" />
               </a>
      </div>
   </div><!-- /content -->
   <aside id="sidebar">
         <%@ include file="incl/indexSidebar_incl.jsp" %>
   </aside>
   <%@ include file="incl/bridalBlog_incl.jsp" %>
   <%@ include file="incl/featuredSpecials_incl.jsp" %>
   <%@ include file="incl/featuredEvents_incl.jsp" %>
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div> <!-- /container -->

<%@ include file="incl/PageFooter_incl.jsp" %>


