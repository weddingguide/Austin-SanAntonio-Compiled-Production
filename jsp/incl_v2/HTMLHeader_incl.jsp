      <title><%=pageTitle%></title>

      <%@ include file="SiteStyle_incl.jsp" %>
      <%@ include file="Facebook_incl.jsp" %>
      <%@ include file="jquery_incl.jsp" %>

      <script type="text/javascript" src="<%=domainName%>/jwplayer/jwplayer.js"></script>
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

      <script type="text/javascript" src="<%=domainName%>/js/jquery.cookie.js"></script>
      <script type="text/javascript" src="<%=domainName%>/js/jquery.hoverIntent.minified.js"></script>
      <script type="text/javascript" src="<%=domainName%>/js/jquery.dcjqaccordion.2.7.min.js"></script>

      <script type="text/javascript" src="<%=domainName%>/jwplayer/jwplayer.js"></script>

      <script type="text/javascript">
      $(document).ready(function($)
      {
         $('#sidenav').dcAccordion(
           {
              eventType: 'click',
              autoClose: true,
              saveState: true,
              disableLink: true,
              speed: 'fast',
              showCount: false,
              autoExpand: true,
              cookie  : 'dcjq-accordion-1',
              classExpand      : 'dcjq-current-parent'
           });
      });
      </script>
