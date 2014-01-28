<div class="wg-virtualBook">
	<div class="wg-info">
		<h1>Where to find a copy</h1>
		<div>
			<span>
				<a href="javascript:history.go(-1)"><img src="img/arrow_pink.png" /> Back to Planning Tools</a>
			</span>
		</div>
		<p>Browse below for a list of local places where you can find your very own copy!</p>
	</div>
	<div class="wg-distribution">
	<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='WG Distribution'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='WG Distribution'">
			<x:set var="weddingGuide" select="string($planningTools/content)"/>
			<c:out value="${weddingGuide}" escapeXml="false"/>
		</x:if>
	</x:forEach>
	</x:if>
	</div>
</div>