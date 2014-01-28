<div style="display:none;">
<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='Idea/Photo Gallery'">
	<x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
		<x:if select="$planningTools/@name='Idea/Photo Gallery'">
			<x:set var="ideaGallery" select="string($planningTools/content)"/>
			<c:out value="${ideaGallery}" escapeXml="false"/>
		</x:if>
	</x:forEach>
</x:if>
</div>
<div class="ig-info">
	<h1>Idea Gallery</h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="img/arrow_pink.png" /> Back to Planning Tools</a>
		</span>
	</div>
	<p>Our Idea Gallery lets you view amazing photographs, taken from Wedding Guide events and the pages of the Wedding Guide. To help you navigate the photos, simply click on the category you wish to view, then you're off!</p>
</div>
<div class="ig-container">
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-bridal-gallery/index.html')">
		<h1>Bridal</h1>
		<img src="img/idea_thumb_bridal.jpg" /></a>
	</div>
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-bridalparty-gallery/index.html')">
		<h1>Bridal Party</h1>
		<img src="img/idea_thumb_brparty.jpg" /></a>
	</div>
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-cakes-gallery/index.html')">
		<h1>Cakes</h1>
		<img src="img/idea_thumb_cakes.jpg" /></a>
	</div>
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-details-gallery/index.html')">
		<h1>Details</h1>
		<img src="img/idea_thumb_details.jpg" /></a>
	</div>
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-decor-gallery/index.html')">
		<h1>Decor</h1>
		<img src="img/idea_thumb_decor.jpg" /></a>
	</div>
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-flowers-gallery/index.html')">
		<h1>Flowers</h1>
		<img src="img/idea_thumb_flowers.jpg" /></a>
	</div>
	<div class="gallery-block">
		<a href="javascript:popUp('http://www.texasweddingsltd.com/idea_gallery/a-locales-gallery/index.html')">
		<h1>Simply Austin</h1>
		<img src="img/idea_thumb_austin.jpg" /></a>
	</div>
	<div class="gallery-block" style="display:none;">
		<a href="#">
		<h1>Fashion Shoots</h1>
		<img src="img/idea_thumb_fashion.jpg" /></a>
	</div>
</div>