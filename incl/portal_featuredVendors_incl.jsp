<x:if select="$doc/WGBE/region/categories/category/spotlightProfiles/profile">
  <h1>Wedding Professionals</h1>
  <span>
    <a href="<x:out select="$doc/WGBE/region/categories/category/@url"/>/?noportal=true"><img src="/img/arrow_pink.png"/>View all professionals</a>
  </span>
  <span>
    <a href="javascript:popUp('/contact.jsp?popup&category=<x:out select="$doc/WGBE/region/categories/category/@id" />&<x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name" />')"><img src="/img/arrow_pink.png"/>Contact all professionals from this category</a>
  </span>
  <div class="portal-vendorList">
    <x:forEach select="$doc/WGBE/region/categories/category/spotlightProfiles/profile" var="sProfile">
      <div>
        <a href="/<x:out select="$sProfile/@urlcompliantvendorname"/>"><x:set var="htmltmp" select="string($sProfile/avatartag)"/>
                  <c:out value="${htmltmp}" escapeXml="false"/>
        <span><x:out select="$sProfile/@vendorName"/></span></a>
      </div>
    </x:forEach>
  </div>
</x:if>          