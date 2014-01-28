<x:set select="$doc/WGBE/region/categories/category/profiles/profile/events" var="pEvents" />
<x:set var ="pEvent" select="string($doc/WGBE/region/categories/category/profiles/profile/events/event)"/>
<h2>Events</h2>
<x:forEach select="$pEvents/event">
	<div class="event-container">
		<h2><x:out select="$pEvents/event/@title"/></h2>
		<c:out value="${pEvent}" escapeXml="false"/>
	</div>
</x:forEach>