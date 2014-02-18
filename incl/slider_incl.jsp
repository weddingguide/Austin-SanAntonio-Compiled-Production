<div class="slider-container">
	<div class="wmuSlider slider">        
    	<div class="wmuSliderWrapper">
			<x:if select="$doc/WGBE/region/staticcontentitems/staticcontent/@name='Home Page Slider'">
			  <x:forEach select="$doc/WGBE/region/staticcontentitems/staticcontent" var="planningTools">
			    <x:if select="$planningTools/@name='Home Page Slider'">
			      <article>
			      <x:set var="slider" select="string($planningTools/content)"/>
			      <c:out value="${slider}" escapeXml="false"/>
			      </article> 
			    </x:if>
			  </x:forEach>
			</x:if>   		
   		</div>
	</div>
</div>
<script>
$(function () {
    $('.slider').wmuSlider({
    	 slideshow: true,
         touch: true,
         animation: 'slide',
         navigationControl: true,
         slide: 'article',
         animationDuration: 600
    });
});   
</script>