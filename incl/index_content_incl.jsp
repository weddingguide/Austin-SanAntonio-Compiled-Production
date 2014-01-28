    <div class="registration">
      <div class="slideOutTip" style="width: 540px; height: 75px;">
          <div class="tipVisible">
            <img class="tipTitle" src="images/regbanner.jpg">
          </div>
          <div class="slideOutContent" style="display: none;">
            <iframe height="1354" allowtransparency="true" frameborder="0" scrolling="no" style="width:100%;border:none" src="https://texasweddings.wufoo.com/embed/m7x2s9/">&lt;a href="https://texasweddings.wufoo.com/forms/m7x2s9/"&gt;Fill out my Wufoo form!&lt;/a&gt;</iframe>
          </div>
      </div>
    </div>
    <div class="slider-container">
      <ul class="bxslider">
                    <li><img src="images/header_cakes.jpg" /></li>
                    <li><img src="images/header_cakes.jpg" /></li>
                    <li><img src="images/header_cakes.jpg" /></li>
     </ul>
    </div>
    <%@ include file="blog_incl.jsp" %>
  
    <div class="special-widget">
      <h1><a href="/specials.jsp">special<em>OFFERS</em></a></h1>
          <p>Enjoy these great exclusive special offers from awesome local professionals!</p>
    <x:forEach select="$doc/WGBE/region/specials/special" var="specialsWidget"> 
    <div class="special-entry">
      <a href="<x:out select="$specialsWidget/@URL"/>"><img src="<x:out select="$specialsWidget/@imageURL"/>"/></a>
      <h2><a href=""/><x:out select="$specialsWidget/@ownerName"/></a></h2>
      <p><x:out select="$specialsWidget/@title"/></p>
      <sub> Expires: <x:out select="$specialsWidget/@expires"/></sub><br />
      <small>(<a href=""/>click for more info</a>)</small>  
    </div>
  </x:forEach>
    </div><!-- end specials widget -->

    <div class="events-widget">
      <h1><a href="/events.jsp">shows&amp;<em>EVENTS</em></a></h1>
      <p>Check out upcoming shows and more from the Wedding Guide and area professionals!</p>
      <x:forEach select="$doc/WGBE/region/events/event" var="eventsWidget">
      <div class="event-entry">
        <a href="<x:out select="$eventsWidget/@URL"/>"><img src="<x:out select="$eventsWidget/@imageURL"/>"/></a>
        <h2><a href="<x:out select="$eventsWidget/@URL"/>"><x:out select="$eventsWidget/@name"/></a></h2>
        <p><x:out select="$eventsWidget/@title"/></p>
        <small>When: <x:out select="$eventsWidget/@end"/><br />(<a href="">click for more info</a>)</small>                    
      </div>
    </x:forEach>
    </div><!-- end events widget -->
    <div class="video-widget">
      <h1><a href="/content.jsp?attrId=158">Wedding Guide &amp; Bridal Extravaganza TV</a></h1>
      <p> Some video will appear here </p>
    </div>
    <!-- Depricated Content
    <x:set var="htmltmp" select="string($doc/WGBE/region/staticcontentitems/staticcontent[@name='Promo Block 2'])"/>
    <c:out value="${htmltmp}" escapeXml="false"/>

    <x:set var="htmltmp" select="string($doc/WGBE/region/staticcontentitems/staticcontent[@name='Promo Block 3'])"/>
    <c:out value="${htmltmp}" escapeXml="false"/>

    <div id="not-blog">
       <x:set var="htmltmp" select="string($doc/WGBE/region/staticcontentitems/staticcontent[@name='BrideTalk'])"/>
       <c:out value="${htmltmp}" escapeXml="false"/>
    </div>
 -->