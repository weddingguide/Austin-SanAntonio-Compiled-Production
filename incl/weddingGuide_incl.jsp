
	<div class="wg-info">
		<h1>Wedding Guide</h1>
		<div>
			<span>
				<a href="planning-tools.jsp"><img src="img/arrow_pink.png" /> Back to Planning Tools</a>
			</span>
		</div>
		
	</div>
	<x:if select="$doc/WGBE/region/@name='San Antonio'">
	<div class="wg-virtual">
	<p>Click on the book below to view the current issue of the Wedding Guide online.</p>
		<div data-configid="2171588/9356648" style="width: 400px; height: 312px;" class="issuuembed"></div><script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>
		<a target="_blank" class="mobile-icon" href="http://online.publicationprinters.com/launch.aspx?eid=cf8b9e6f-3753-40e8-9c20-cb02045448cf"><img src="/img/wg_thumb2.jpg" /></a>
	</div>
	</x:if>
	<div class="wg-distribution">
	<p>Browse below for a list of local places where you can find your very own copy.</p>
	<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='WG Distribution'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='WG Distribution'">
			<x:set var="weddingGuide" select="string($planningTools/content)"/>
			<c:out value="${weddingGuide}" escapeXml="false"/>
		</x:if>
	</x:forEach>
	</x:if>
	</div>
