   <x:if select="$doc/WGBE/region/categories/category/spotlightProfiles/profile">
       <div class="spotlight">
          <x:forEach select="$doc/WGBE/region/categories/category/spotlightProfiles/profile" var="sProfile">
              <div class="<x:out select="$sProfile/@ndxid"/>">
                 <a href="/<x:out select="$sProfile/@urlcompliantvendorname"/>">
                    <x:set var="htmltmp" select="string($sProfile/avatartag)"/>
                    <c:out value="${htmltmp}" escapeXml="false"/>
                 </a>
                 <div class="label">
                    <div>
                       <a href="/<x:out select="$sProfile/@urlcompliantvendorname"/>">
                          <x:out select="$sProfile/@vendorName"/>
                       </a>
                       </a>
                    </div>
                 </div>
              </div>
          </x:forEach>
          <br class="clear" />
       </div>
   </x:if>
