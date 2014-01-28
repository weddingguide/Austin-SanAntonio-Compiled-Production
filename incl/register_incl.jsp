<div class="pt-info">
	<h1>Bride Registration</h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back</a>
		</span>
	</div>
</div>
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='Bride Registration'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='Bride Registration'">
			<x:set var="register" select="string($planningTools/content)"/>
			<c:out value="${register}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>