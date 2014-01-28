<div class="pt-info">
	<h1>Contact Us</h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back</a>
		</span>
	</div>
</div>
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='ContactUsContents'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='ContactUsContents'">
			<x:set var="contactUs" select="string($planningTools/content)"/>
			<c:out value="${contactUs}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>