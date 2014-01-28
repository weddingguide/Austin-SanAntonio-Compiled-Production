<%@ include file="incl/pagesetup_incl.jsp" %>
<%@ include file="dataaccess/profile_dataaccess_incl.jsp" %>
<%@ include file="dataaccess/dataaccess2_incl.jsp" %>

<%@ include file="incl/PageHead_incl.jsp" %>
<%@ include file="incl/profile_facebookJs_incl.jsp" %>

<div id="container">
   <header>
      <%@ include file="incl/header_incl.jsp" %>
   </header>
   <div id="content" class="profile">
               <div class="profile-container">
                  <div class="profileInfo">
                     <%@ include file="incl/profile_profileInfo_incl.jsp" %>
                  </div>
                  <div class="profileDescription">
                     <%@ include file="incl/profile_profileDescription_incl.jsp" %>
                  </div>
                  <hr />
                  <div class="profileMedia" id="pNav">
                     <%@ include file="incl/profile_profileVirtualTours_incl.jsp" %>
                  </div>
               </div>
               <aside class="profile-nav">
                  <%@ include file="incl/profile_profileNav_incl.jsp" %>
               </aside>
            </div><!-- end content wrap -->
<footer>
   <%@ include file="incl/footer_incl.jsp" %>
</footer>
</div> <!-- /container -->

<%@ include file="incl/PageFooter_incl.jsp" %>
