<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='Checklists'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='Checklists'">
			<x:set var="checkLists" select="string($planningTools/content)"/>
			<c:out value="${checkLists}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>
