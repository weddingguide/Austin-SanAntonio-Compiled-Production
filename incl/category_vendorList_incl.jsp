<x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet/profiles/profile" var="cProfile">
   <div class="vendor-entry">
      <a href="/<x:out select="$cProfile/@urlcompliantvendorname"/>"><img src="<x:out select="$cProfile/@avatarURL"/>" /></a>
      <h3><a href="/<x:out select="$cProfile/@urlcompliantvendorname"/>"><x:out select="$cProfile/@vendorName"/></a></h3>
      <x:choose>
	        <x:when select="$cProfile/ContactInfoSets/@count > 1">
    		  <p>Multiple Locations</p>
      		</x:when>
      		<x:otherwise>
      			<p>
      			<x:set var="cAddress" select="string($cProfile/ContactInfoSets/ContactInfo/address)"/><c:out value="${cAddress}" escapeXml="false"/><br />
      		  <x:out select="$cProfile/ContactInfoSets/ContactInfo/phoneNumbers/phoneNumber/@number"/></p>
      		</x:otherwise>
      	</x:choose>
      <p class="more-link"><a href="/<x:out select="$cProfile/@urlcompliantvendorname"/>"><span>Click here for more!</span><i>&gt;</i></a></li></p>
   </div>
</x:forEach>
<x:if select="$doc/WGBE/region/categories/category/@usePortalPage='true'">
    <span><a href="<x:out select="$doc/WGBE/region/categories/category/@url"/>"><img src="/img/arrow_pink.png" /> Back to Portal</a></span>
</x:if>   
<br />
<x:if select="$doc/WGBE/region/categories/category/profileSets/@paginate='true'">
        <x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet" var="profileSet">
                <span><img src="/img/arrow_pink.png" /> <a href="?noportal=true&page=<x:out select="$profileSet/@id"/>">Page <x:out select="$profileSet/@id"/></a></span>
        </x:forEach>
</x:if>

