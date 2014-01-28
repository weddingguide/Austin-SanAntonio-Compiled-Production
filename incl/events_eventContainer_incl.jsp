<x:forEach select="$doc/WGBE/region/events/event" var="eventListing">
<div class="event-listing">
						<a href="<x:out select="$eventListing/@eventURL"/>"><img src="<x:out select="$eventListing/@imageURL"/>" /></a>
						<div class="eventInfo">
							<a href="<x:out select="$eventListing/@eventURL"/>"><h2><x:out select="$eventListing/@name"/></h2></a>
							<p><x:out select="$eventListing/@eventPhone"/></p>
							<p><em><x:out select="$eventListing/@title"/></em></p>
							<x:set var="eventText" select="string($eventListing)"/>
							<c:out value="${eventText}" escapeXml="false"/>
							<p>(<a href="<x:out select="$eventListing/@eventURL"/>">more information</a>)</p>
						</div>
					</div>
</x:forEach>