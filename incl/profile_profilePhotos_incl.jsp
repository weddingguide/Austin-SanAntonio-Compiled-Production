      <script>
      $(function () {
         $('.gallery').wmuSlider({
               touch: true,
               animation: 'slide'
         });
      });   
      </script>
<h2>Photos</h2>
    <!-- BEGIN .wmuSlider -->
<div class="wmuSlider gallery">        
   <div class="wmuSliderWrapper">
         <x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/images/image" var="pImage">
         <article>
            <img src="<x:out select="$pImage/@url"/>" />
         </article>
         </x:forEach>
   </div>                        
</div>
<!-- END .wmuSlider -->
