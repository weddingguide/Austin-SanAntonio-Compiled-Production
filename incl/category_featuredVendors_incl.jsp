<x:if select="$doc/WGBE/region/categories/category/spotlightProfiles/profile">
            <div>
              <img src="/img/featuredvendors_block.jpg" />
            </div>
            <x:forEach select="$doc/WGBE/region/categories/category/spotlightProfiles/profile" var="sProfile">
              <div>
                <a href="/<x:out select="$sProfile/@urlcompliantvendorname"/>">
                  <x:set var="htmltmp" select="string($sProfile/avatartag)"/>
                  <c:out value="${htmltmp}" escapeXml="false"/>
                  <span><x:out select="$sProfile/@vendorName"/></span>
                </a>
              </div>
            </x:forEach>
</x:if>
