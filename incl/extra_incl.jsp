   <x:forEach select="$doc/WGBE/region/featuredprofiles/profile" var="fprofile">
      <div class="featured-home">
         <a href="/<x:out select="$fprofile/@urlcompliantvendorname"/>">
            <x:set var="htmltmp" select="string($fprofile/avatartag)"/>
            <c:out value="${htmltmp}" escapeXml="false"/>
         </a>
         <h2>
            <a href="/<x:out select="$fprofile/@urlcompliantvendorname"/>">
               <x:out select="$fprofile/@vendorName"/>
            </a>
         </h2>
            <p>
               <x:set var="htmltmp" select="string($fprofile/abstract)"/>
               <c:out value="${htmltmp}" escapeXml="false"/>
            </p>
         <p class="more">
            [<a href="/<x:out select="$fprofile/@urlcompliantvendorname"/>">more</a>]
         </p>
      </div>
   </x:forEach>
