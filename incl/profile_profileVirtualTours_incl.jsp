<h2>Virtual Tour</h2>
<p>Double click on the virtual tour to view it in full screen.</p>
<x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/virtualTours/virtualTour" var="pVirtualTour">
	<div class="virtualTour-container">
		<iframe src="http://texasweddingsltd.com/galleries/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@id"/>/<x:out select="$pVirtualTour/@url"/>"></iframe>
	</div>
</x:forEach>