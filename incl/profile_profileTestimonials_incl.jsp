<x:set select="$doc/WGBE/region/categories/category/profiles/profile/testimonials" var="pTestimonials" />
<x:set var ="pTestimonial" select="string($pTestimonials/testimonial)"/>
<h2>Testimonials</h2>
<x:forEach select="$pTestimonials/testimonial">
	<div class="event-container">
		<c:out value="${ppTestimonial}" escapeXml="false"/>
	</div>
</x:forEach>