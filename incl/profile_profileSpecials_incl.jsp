<h2>Specials</h2>
<x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/specials/special" var="pSpecials">
<x:set var ="pSpecial" select="string($pSpecials)"/>
	<div class="special-container">
		<h2><x:out select="$pSpecials/@title"/> <em>Offer expires: <x:out select="$pSpecials/@expires"/></em></h2>
		<c:out value="${pSpecial}" escapeXml="false"/>
	</div>
</x:forEach>