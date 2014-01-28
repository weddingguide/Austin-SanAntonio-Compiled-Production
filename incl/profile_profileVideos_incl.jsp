<h2>Video</h2>
   <x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video" var="pVideo">
      <x:if select="$pVideo/@source='YouTube'">
                      <div class="video-container">
                              <h2><x:out select="$pVideo/@title"/></h2>
                              <p><x:out select="$pVideo/description"/></p>
                              <x:set var="videoUrl" select="string($pVideo/@url)"/>
                              <c:out value="${videoUrl}" escapeXml="false"/>
                      </div>
      </x:if>
   </x:forEach>

   <x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video" var="pVideo">
      <x:if select="$pVideo/@source='Vimeo'">
                      <div class="video-container">
                              <h2><x:out select="$pVideo/@title"/></h2>
                              <p><x:out select="$pVideo/description"/></p>
                              <x:set var="videoUrl" select="string($pVideo/@url)"/>
                              <c:out value="${videoUrl}" escapeXml="false"/>
                      </div>
      </x:if>
   </x:forEach>

   <x:if select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video/@source='Upload'">
                   <script type="text/javascript" src="/js/swfobject.js"></script>
                   <script type="text/javascript" src="/js/jwplayer.js"></script>
                   <div id="video">Loading the player...</div>
                   <script type="text/javascript">
                           jwplayer("video").setup({
                                   flashplayer: "/js/player.swf",
                                           playlist: [
                                           <x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video" var="pVideo">
                                              <x:if select="$pVideo/@source='Upload'">
                                                 {
                                                         file: "<x:out select="$pVideo/@id" />",
                                                         image: "",
                                                         title: "<x:out select="$pVideo/@title" />",
                                                         description: "<x:out select="$pVideo/description" />"
                                                 },
                                              </x:if>
                                           </x:forEach>
                                           ],
                                                   listbar: {
                                                           position: "bottom",
                                                           size: 160
                                                   },
                                                   height: 540,
                                                   width: 684,
                                                   skin: "/js/brides/brides/brides.xml"
                                           });
                   </script>
   </x:if>
