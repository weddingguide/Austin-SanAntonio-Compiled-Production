<x:set select="$doc/WGBE/region/categories/category/profiles/profile/details" var="pDetails" />
<x:if select="$pDetails/@omit='false'">
	<h2>Details</h2>
		<x:if select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name='Venues'">
		<p><a href="/directory.jsp?category=36">Compare to other venues</a></p>
		<p>Max Capacity: <x:out select="$pDetails/@MaxCapacity"/></p>
		<ul>
			<x:if select="$pDetails/@BridesRoom !='N'">
			<li class="brideDressingRoom"><span>Bride's Dressing Room</span></li>
			</x:if>
			<x:if select="$pDetails/@CeremonySite !='N'">
			<li class="ceremonySite"><span>Ceremony Site</span></li>
			</x:if>
			<x:if select="$pDetails/@Indoor !='N'">
			<li class="indoorOnly"><span>Indoor Only</span></li>
			</x:if>
			<x:if select="$pDetails/@Outdoor !='N'">
			<li class="outdoorOnly"><span>Outdoor Only</span></li>
			</x:if>
			<x:if select="$pDetails/@InHouseCatering !='N'">
			<li class="inHouseCateringOnly"><span>In-House Catering Only</span></li>
			</x:if>
			<x:if select="$pDetails/@InHouseLiquor !='N'">
			<li class="inHouseLiquorOnly"><span>In-house Liquor Only</span></li>
			</x:if>
			<x:if select="$pDetails/@GardenPatio !='N'">
			<li class="gardenPatio"><span>Garden/Patio</span></li>
			</x:if>
			<x:if select="$pDetails/@DanceFloor !='N'">
			<li class="danceFloor"><span>Dance Floor</span></li>
			</x:if>
			<x:if select="$pDetails/@BandDJAllowed !='N'">
			<li class="bandsDj"><span>Bands/DJ Allowed</span></li>
			</x:if>
			<x:if select="$pDetails/@Cake !='N'">
			<li class="canProvideCake"><span>Can Provide Cake</span></li>
			</x:if>
			<x:if select="$pDetails/@Valet !='N'">
			<li class="valetParking"><span>Valet Parking</span></li>
			</x:if>
			<x:if select="$pDetails/@FreeParking !='N'">
			<li class="freeParking"><span>Free Parking</span></li>
			</x:if>
			<x:if select="$pDetails/@SecurityRequired !='N'">
			<li class="securityRequired"><span>Security Required</span></li>
			</x:if>
		</ul>
		</x:if>
		<x:if select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name='Accommodations'">
		<p><a href="/directory.jsp?category=3">Compare to other accomodations</a></p>
		<ul>
			<x:if select="$pDetails/@AirportShuttle !='N'">
			<li class="airportShuttle"><span>Airport Shuttle</span></li>
			</x:if>
			<x:if select="$pDetails/@BreakfastIncluded !='N'">
			<li class="breakfastIncluded"><span>Breakfast Included</span></li>
			</x:if>
			<x:if select="$pDetails/@BusinessCenter !='N'">
			<li class="businessCenter"><span>Business Center</span></li>
			</x:if>
			<x:if select="$pDetails/@Central !='N'">
			<li class="central"><span>Central</span></li>
			</x:if>
			<x:if select="$pDetails/@DiscountRoomBlocksAvailable !='N'">
			<li class="discountRoom"><span>Discount Room Blocks Available</span></li>
			</x:if>
			<x:if select="$pDetails/@Downtown !='N'">
			<li class="downtown"><span>Downtown</span></li>
			</x:if>
			<x:if select="$pDetails/@East !='N'">
			<li class="east"><span>East</span></li>
			</x:if>
			<x:if select="$pDetails/@FitnessCenter !='N'">
			<li class="fitnessCenter"><span>Fitness Center</span></li>
			</x:if>
			<x:if select="$pDetails/@FreeParking !='N'">
			<li class="freeParking"><span>Free Parking</span></li>
			</x:if>
			<x:if select="$pDetails/@FreeWiFi !='N'">
			<li class="freeWifi"><span>Free WiFi</span></li>
			</x:if>
			<x:if select="$pDetails/@HandicapRoomsAvailable !='N'">
			<li class="handicapRoom"><span>Handicap Rooms Available</span></li>
			</x:if>
			<x:if select="$pDetails/@Kitchenettes !='N'">
			<li class="kitchenettes"><span>Kitchenettes</span></li>
			</x:if>
			<x:if select="$pDetails/@MeetingRooms !='N'">
			<li class="meetingRoom"><span>Meeting Rooms</span></li>
			</x:if>
			<x:if select="$pDetails/@Near6thStreetForAustin !='N'">
			<li class="near6th"><span>Near 6th Street in Austin</span></li>
			</x:if>
			<x:if select="$pDetails/@NearRiverwalkForSanAntonio !='N'">
			<li class="nearRiver"><span>Near Riverwalk in San Antonio</span></li>
			</x:if>
			<x:if select="$pDetails/@North !='N'">
			<li class="north"><span>North</span></li>
			</x:if>
			<x:if select="$pDetails/@Northeast !='N'">
			<li class="northEast"><span>Northeast</span></li>
			</x:if>
			<x:if select="$pDetails/@Northwest !='N'">
			<li class="northWest"><span>Northwest</span></li>
			</x:if>
			<x:if select="$pDetails/@PetFriendly !='N'">
			<li class="petFriendly"><span>Pet Friendly</span></li>
			</x:if>
			<x:if select="$pDetails/@RestaurantBaronSiteNearby !='N'">
			<li class="restaurantsNear"><span>Restaurant Baron Site Nearby</span></li>
			</x:if>
			<x:if select="$pDetails/@South !='N'">
			<li class="south"><span>South</span></li>
			</x:if>
			<x:if select="$pDetails/@Southeast !='N'">
			<li class="southEast"><span>Southeast</span></li>
			</x:if>
			<x:if select="$pDetails/@Southwest !='N'">
			<li class="southWest"><span>Southwest</span></li>
			</x:if>
			<x:if select="$pDetails/@SuitesAvailable !='N'">
			<li class="suitesAvailable"><span>Suites Available</span></li>
			</x:if>
			<x:if select="$pDetails/@SwimmingPool !='N'">
			<li class="swimmingPool"><span>Swimming Pool</span></li>
			</x:if>
			<x:if select="$pDetails/@West !='N'">
			<li class="west"><span>West</span></li>
			</x:if>
		</ul>
		</x:if>
</x:if>