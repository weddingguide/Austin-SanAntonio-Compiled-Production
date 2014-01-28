			<div class="shows-events">
				<h1 class="events-title">shows&amp;<span>events</span></h1>
				<x:forEach select="$doc/WGBE/region/events/event" var="eventEntry">
				<div>
					<img src="<x:out select="$eventEntry/@imageURL"/>" height="50" width="50" />
					<h3><a href="<x:out select="$eventEntry/@eventURL"/>"><x:out select="$eventEntry/@name" /></a></h3>
					<p><x:out select="$eventEntry/@title"/>
					<br />(<a href="<x:out select="$eventEntry/@eventURL"/>">click for more info</a>)</p>
				</div>
				</x:forEach>
				<br class="clearfix" />
			</div>