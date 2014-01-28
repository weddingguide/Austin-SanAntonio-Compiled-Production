<img src="http://austin.texasweddingsltd.net/img/profilefeatures.png"/>
                  <ul class="profileNavigation">
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@url" var="pWebsite">
                     <li class="website"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@url"/>" onclick="_gaq.push(['_trackEvent', 'Profile link', 'Visited', '<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@url"/>'])"
                target="_blank">Website</a></li>
                  </x:if>
                     <li class="email"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/contact">E-mail</a></li>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/map/@url!=''">
                     <x:choose>
                        <x:when select="$doc/WGBE/region/categories/category/profiles/profile/map/@embed='true'">   
                           <li class="map"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/map">Map</a></li>
                        </x:when>
                        <x:otherwise>
                           <li class="map"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/map/@url"/>" onClick="recordOutboundLink(this, 'Profile Map Links', '<x:out select="$doc/WGBE/region/categories/category/profiles/profile/map/@url"/>');return false;" target="_blank">Map</a></li>
                        </x:otherwise>
                     </x:choose>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/@id ='36'">
	                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/details/@omit !='true'">
	                     <li class="details"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/details">Details</a></li>
	                  </x:if>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/@id ='3'">
	                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/details/@omit !='true'">
	                     <li class="details"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/details">Details</a></li>
	              	  </x:if>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/testimonials/testimonial">
                     <li class="testimonials"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/testimonials">Testimonials</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/events/event">
                     <li class="events"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/events">Events</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/specials/special">
                     <li class="specials"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/specials">Specials</a></li>
                  </x:if>
                     <li class="photos"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/#pNav">Photos</a></li>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video">
                     <x:choose>
                        <x:when select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video/@source='External URL'">
                           <li class="videos"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video/@id"/>">Videos</a></li>
                        </x:when>
                        <x:when select="$doc/WGBE/region/categories/category/profiles/profile/videoclips/video/@source!='External URL'">
                           <li class="videos"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/videos">Videos</a></li>
                        </x:when>
                     </x:choose>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/audioclips/audio">
                     <li class="audio"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/audio">Audio</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/virtualTours/virtualTour">
                     <li class="virtual-tour"><a href="/<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@urlcompliantvendorname"/>/virtual-tours">Virtual Tour</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@facebook">
                     <li class="facebook"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@facebook"/>">Facebook</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@twitter">
                     <li class="twitter"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@twitter"/>">Twitter</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@pinterest">
                     <li class="pinterest"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@pinterest"/>">Pinterest</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@googleplus">
                     <li class="googleplus"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@googleplus"/>">Google&plus;</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@instagram">
                     <li class="instagram"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@instagram"/>">Instagram</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@blog">
                     <li class="blog"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@blog"/>">Blog</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@linkedin">
                     <li class="linkedin"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@linkedin"/>">Linked In</a></li>
                  </x:if>
                  <x:if select="$doc/WGBE/region/categories/category/profiles/profile/@myspace">
                     <li class="myspace"><a href="http://<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@myspace"/>">Myspace</a></li>
                  </x:if>
                  </ul>