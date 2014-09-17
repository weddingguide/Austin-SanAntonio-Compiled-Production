
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
	<p>Click on the book below to view the current issue of the Wedding Guide online. test</p>
		<div class="virtualBook"><object type="application/x-shockwave-flash" data="http://edition.pagesuite-professional.co.uk/MiniFlip2008.swf?pbid=390eb576-bd7f-4317-8ceb-d7f0c0180c1d&urlTarget=blank&spincolor=FFFFFF&pages=6&amp;w=140&speed=4" width="300px" height="220px" id="MiniFlip2008" align="left"><param name="allowScriptAccess" value="always" ><param name="allowFullScreen" value="false" ><param name="quality" value="high" ><param name="scale" value="noscale" ><param name="salign" value="lt" ><param name="bgcolor" value="#FFFFFF" ><param name="movie" value="http://edition.pagesuite-professional.co.uk/MiniFlip2008.swf?pbid=390eb576-bd7f-4317-8ceb-d7f0c0180c1d&urlTarget=blank&spincolor=FFFFFF&amp;pages=6&amp;w=140&amp;speed=4"></object></div>
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
