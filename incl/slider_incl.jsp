<div class="slider-container">
	<div class="wmuSlider slider">        
    	<div class="wmuSliderWrapper">
			  <x:forEach select="$doc/WGBE/region/sliders/slider" var="slider">
			      <article>
			      <x:set var="content" select="string($slider/content)"/>
			      <c:out value="${content}" escapeXml="false"/>
			      </article> 
			  </x:forEach> 		
   		</div>
	</div>
</div>
<script>
$(function () {
    $('.slider').wmuSlider({
    	 slideshow: <x:out select="$doc/WGBE/region/sliders/@disableRotation"/>,
         touch: true,
         animation: 'slide',
         navigationControl: true,
         slide: 'article',
         animationDuration: 600
    });
});   
</script>