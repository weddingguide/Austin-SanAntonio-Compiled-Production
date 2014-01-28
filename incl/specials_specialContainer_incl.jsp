<x:forEach select="$doc/WGBE/region/specials/special" var="specialListing">
<div class="special-listing">
						<a href="<x:out select="$specialListing/@profileURL"/>"><img src="<x:out select="$specialListing/@imageURL"/>" /></a>
						<div class="specialInfo">
							<a href="<x:out select="$specialListing/@profileURL"/>"><h2><x:out select="$specialListing/@ownerName"/></h2></a>
							<p><x:out select="$specialListing/@phone"/></p>
							<p><em><x:out select="$specialListing/@title"/></em><br/>
							Expires: <x:out select="$specialListing/@expires"/></p>
							<x:set var="specialText" select="string($specialListing)"/>
							<c:out value="${specialText}" escapeXml="false"/>
							<p>(<a href="<x:out select="$specialListing/@profileURL"/>">more information</a>)</p>
						</div>
					</div>
</x:forEach>