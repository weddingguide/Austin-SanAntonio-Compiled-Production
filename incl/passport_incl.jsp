<div class="pt-info">
	<h1>Passport to Marriage</h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back</a>
		</span>
	</div>
</div>
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='PassportToMarriage'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='PassportToMarriage'">
			<x:set var="content" select="string($planningTools/content)"/>
			<c:out value="${content}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>