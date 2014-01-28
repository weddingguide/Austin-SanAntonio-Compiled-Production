<script language="JavaScript">
   var links = new Array; //These are URLs for the banners
   var targets = new Array;
   var description = new Array;
   var banner = new Array;

   <x:forEach select="$doc/WGBE/region/banners/banner" var="banner">
      banner[     <x:out select="$banner/@ndx"/>]       = new Image();
      banner[     <x:out select="$banner/@ndx"/>].src   = "<x:out select="$banner/@image"/>";
      links[      <x:out select="$banner/@ndx"/>]       = "<x:out select="$banner/@link"/>";
      targets[    <x:out select="$banner/@ndx"/>]       = "<x:out select="$banner/@target"/>";
      description[<x:out select="$banner/@ndx"/>]       = "<x:out select="$banner/@description"/>";
   </x:forEach>

   var totalBanners = <x:out select="$doc/WGBE/region/banners/@count"/>;
   var currBannerLinks = new Array;
   var currBannerDescriptions = new Array;

   function randomizeBanners()
   {
      var banner1Ndx = Math.floor(Math.random()*totalBanners);

      document.banner[0].src = banner[banner1Ndx].src;
      var anchor0 = document.getElementById( "bannerLink0");
      anchor0.href = links[banner1Ndx];
      if ( targets[banner1Ndx] != "" ) anchor0.target = targets[banner1Ndx];
      currBannerDescriptions[0] = description[banner1Ndx];

      var banner2Ndx = banner1Ndx;
      if ( totalBanners > 1 )
      {
         while (banner2Ndx == banner1Ndx)
         {
            banner2Ndx = Math.floor(Math.random()*totalBanners);
         }
      }
      document.banner[1].src = banner[banner2Ndx].src;
      var anchor1 = document.getElementById( "bannerLink1");
      anchor1.href = links[banner2Ndx];
      if ( targets[banner2Ndx] != "" ) anchor1.target = targets[banner2Ndx];
      currBannerDescriptions[1] = description[banner2Ndx];

      window.setTimeout("randomizeBanners()",10000);
   }

   function descript(ndx)
   {
       window.status = currBannerDescriptions[ndx];
   }
</script>
