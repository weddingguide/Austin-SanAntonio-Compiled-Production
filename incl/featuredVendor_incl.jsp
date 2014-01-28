<div class="featured-vendors">
					<img src="img/featuredvendors.png" />
					<x:forEach select="$doc/WGBE/region/featuredprofiles/profile" var="fprofile">
						<div>
							<img src="<x:out select="$fprofile/@avatarURL"/>" height="55" width="55"/>
							<h3><a href="<x:out select="$fprofile/@urlcompliantvendorname"/>"><x:out select="$fprofile/@vendorName"/></a></h3>
							<p>(<a href="<x:out select="$fprofile/@urlcompliantvendorname"/>">view profile</a>)</p>
						</div>
					</x:forEach>
</div>