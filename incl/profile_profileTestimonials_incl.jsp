<h2>Testimonials</h2>
<x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/testimonials/testimonial" var="pTestimonials">
<x:set var ="pTestimonial" select="string($pTestimonials)"/>
	<div class="event-container">
		<c:out value="${pTestimonial}" escapeXml="false"/>
	</div>
</x:forEach>