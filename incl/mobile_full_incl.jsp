   <c:if test="${ not empty param.fullsite}" >
      <c:set var="fullSiteOnly" value="*" scope="session" />
   </c:if>
   <c:if test="${ empty fullSiteOnly}" >
      <script type="text/javascript">
         if (screen.width <= 699)
         {
            document.location = "http://<x:out select="$doc/WGBE/region/mobiledomain"/>";
         }
      </script>
   </c:if>
   <script type="text/javascript" src="/js/redirection-mobile.js"/>
   <script type="text/javascript">
         SA.redirection_mobile ({
                                  tablet_redirection : "true",
                                  mobile_url : "<x:out select="$doc/WGBE/region/mobiledomain"/>",
                                  mobile_prefix : "http"
                               });
   </script>
