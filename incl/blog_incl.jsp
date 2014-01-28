<div class="blog-widget">
   <h1>Bridal Blog</h1>
   <p class="arrow"><img src="images/arrow_pink.png" /> Visit the Bridal Blog</p>
   <p class="arrow"><img src="images/arrow_pink.png" /> Submit a Love Story!</p>
   <x:forEach select="$doc/WGBE/region/blogPosts/blogPost" var="blogEntry">
   <div class="blog-entry">
      <h2><a href="http://<x:out select="$blogEntry/@link"/>" target="_blog"><x:out select="$blogEntry/@title"/></a> <sub><x:out select="$blogEntry/@pubdate"/></sub></h2>
      <p><x:out select="$blogEntry/abstract"/>[<a href="<x:out select="http://$blogEntry/@link"/>">continue</a>]
   </div>
   </x:forEach>
</div><!-- End blog widget -->


<!-- Depricated Blog Code
   <div id="blog">
      <a href="<x:out select="$doc/WGBE/region/@blog"/>" target="_blog" id="blog-logo">
         <img src="/images/blog.png" width="213" height="52" border="0" />
      </a>

      <p class="blog-feed">
         <a target="_blog" href="<x:out select="$doc/WGBE/region/blog/@link"/>">
            <x:out select="$doc/WGBE/region/blog/@title"/>
         </a>
         <br />
         <small>
            <x:out select="$doc/WGBE/region/blog/@pubdate"/>
         </small>
      </p>

      <p>
         <x:out select="$doc/WGBE/region/blog/abstract"/>
         &nbsp;
         <a target="_blog" href="<x:out select="$doc/WGBE/region/blog/@link"/>">
            [more...]
         </a>
      </p>
   </div>
-->
