<div class="pt-info">
	<h1>About Us</h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back</a>
		</span>
	</div>
</div>
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='About'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='About'">
			<x:set var="about" select="string($planningTools/content)"/>
			<c:out value="${about}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>