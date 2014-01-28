         <% if (( videoType == SegmentDef.TYPE_GALLERY_VIDEO )
             || ( videoType == SegmentDef.TYPE_LIVE_STREAM   ))
            {
         %>
               <div class="dropshadow" id="jwplayer<%=i%>" >
                  loading...
               </div>

                  <script type="text/javascript">
                     jwplayer("jwplayer<%=i%>").setup(
                     {
                        height: <%=playerHeight%>,
                        width:  <%=playerWidth%>,
                        fullscreen: false,
                        image: "<%=videoDomain%><%= ImageCacheHandler.cachedImageURL( videoName+".jpg",
                                                                      SiteProperty.valueOf( dbData, "videoRoot" )+"\\"+videoFolder+"\\",
                                                                      SiteProperty.valueOf( dbData, "cachePathRoot" )+"\\"+videoFolder+"\\",
                                                                      SiteProperty.valueOf( dbData, "imageCacheRootURL" )+"/"+videoFolder+"/",
                                                                      SiteProperty.valueOf( dbData, "defaultImageFilePathRoot" ),
                                                                      SiteProperty.valueOf( dbData, "videoThumbnail" ),
                                                                      playerWidth+"_"+playerHeight+"_",
                                                                      playerWidth,
                                                                      playerHeight,
                                                                      false ) %>",
                        modes: [
                                 {
                                   type: "flash",
                                   src: "/jwplayer/player.swf",
                                   config:
                                   {
                                       <% if ( videoType == SegmentDef.TYPE_LIVE_STREAM   )
                                          {
                                       %>
                                             file: "<%=videoFolder%>",
                                             live: true,
                                             streamer: "rtmp://jwmhosting.net/live",
                                             stretching: "exactfit",
                                       <% }
                                          else
                                          {
                                              if (flv)
                                              {
                                        %>
                                                 file: "<%=videoFolder%>/<%=videoName%>.flv",
                                                 stretching: "exactfit", // this is necessary for live stream replay; most likely the only reason we'd have flv here
                                        <%    }
                                              else
                                              {
                                        %>
                                                 file: "mp4:<%=videoFolder%>/<%=videoName%>.mp4",
                                           <% } %>
                                              streamer: "rtmp://jwmhosting.net/simplevideostreaming",
                                        <% } %>
                                      provider: "rtmp"
                                   }
                                 },
                       <% if (!videoName.equals("$live$"))  // only one mode if live stre3am
                          {
                       %>
                                 {
                                   type: "html5",
                                   config:
                                   {
                                      file: "<%=videoDomain%><%=videoRootURL+"/"+videoName+".mp4"%>"
                                   }
                                 },
                                 {
                                   type: "download",
                                   config:
                                   {
                                      file: "<%=videoDomain%><%=videoRootURL+"/"+videoName+".mp4"%>"
                                   }
                                 }
                      <% } %>
                               ]
                     });
                  </script>
         <%
            }
            else if ( videoType == SegmentDef.TYPE_VIMEO )
            {
          %>
                <div class="dropshadow">
                  <iframe src="http://player.vimeo.com/video/<%=videoName%>"
                      width="<%=playerWidth%>"
                      height="<%=playerHeight%>"
                      frameborder="0"
                      webkitAllowFullScreen
                      mozallowfullscreen
                      allowFullScreen>
                  </iframe>
               </div>
          <%
             }
          %>
