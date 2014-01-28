<div class="special-offers">
			<h1 class="special-title">special<span>offers</span></h1>
			<x:forEach select="$doc/WGBE/region/specials/special" var="specialEntry">	
				<div>
					<a href="<x:out select="$specialEntry/@profileURL"/>"><img src="<x:out select="$specialEntry/@imageURL"/>" height="50" width="50" /></a>
					<h3><a href="<x:out select="$specialEntry/@profileURL"/>"><x:out select="$specialEntry/@ownerName" /></a></h3>
					<p><x:out select="$specialEntry/@title" />
					<br />(<a href="<x:out select="$specialEntry/@profileURL"/>">click for more info</a>)</p>
				</div>			
			</x:forEach>
			<br class="clearfix" />
</div>		