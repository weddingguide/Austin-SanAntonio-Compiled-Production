<h2>Virtual Tour</h2>
<x:forEach select="$doc/WGBE/region/categories/category/profiles/profile" var="pVirtualTour">
	<div class="virtualTour-container">
		<iframe src="http://texasweddingsltd.com/galleries/<x:out select="$pVirtualTour/@id"/>/vt1/_flash_html5/pano1.html"></iframe>
	</div>
</x:forEach>