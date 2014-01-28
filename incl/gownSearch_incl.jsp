<div class="gs-info">
	<h1>Gown Search</h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="img/arrow_pink.png" /> Back to Planning Tools</a>
		</span>
	</div>
	<p>Still looking for the perfect wedding gown? We can help! Begin by visiting the web sites of some of the biggest names in bridal fashions. Simply select a designer/manufacturer from the list below.</p>
</div>
<div class="gs-container">
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='Idea/Photo Gallery'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='Wedding Gown Search'">
			<x:set var="ideaGallery" select="string($planningTools/content)"/>
			<c:out value="${ideaGallery}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>
</div>