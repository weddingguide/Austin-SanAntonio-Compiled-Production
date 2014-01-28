<x:if select="$doc/WGBE/region/categories/category/@id='36'">
<x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet/profiles/profile" var="dProfile">
<x:if select="$dProfile/details/@omit !='true'">
<div class="directory-block">
   <h1><a href="/<x:out select="$dProfile/@urlcompliantvendorname"/>"><x:out select="$dProfile/@vendorName"/></a></h1>
   <a href="">Max Capacity:<x:out select="$dProfile/details/@MaxCapacity"/></a>
   <ul>
   <x:if select="$dProfile/details/@BridesRoom !='N'">
      <li class="brideDressingRoom"><a href="">Bride's Dressing Room</a></li>
   </x:if>
   <x:if select="$dProfile/details/@CeremonySite !='N'">
      <li class="ceremonySite"><a href="">Ceremony Site</a></li>
   </x:if>
   <x:if select="$dProfile/details/@Indoor !='N'">
      <x:if select="$dProfile/details/@Outdoor !='Y'">
         <li class="indoorOnly"><a href="">Indoor Only</a></li>
      </x:if>
   </x:if>
   <x:if select="$dProfile/details/@Outdoor !='N'">
      <x:if select="$dProfile/details/@Indoor !='Y'">
         <li class="outdoorOnly"><a href="">Outdoor Only</a></li>
      </x:if>
   </x:if>
   <x:if select="$dProfile/details/@Outdoor !='N'">
      <x:if select="$dProfile/details/@Indoor !='N'">
         <li class="bothInOutdoor"><a href="">Both (In/Outdoor)</a></li>
      </x:if>
   </x:if>
   <x:if select="$dProfile/details/@InHouseCatering !='N'">
      <li class="inHouseCateringOnly"><a href="">In-House Catering Only</a></li>
   </x:if>
   <x:if select="$dProfile/details/@InHouseLiquor !='N'">
      <li class="inHouseLiquorOnly"><a href="">In-house Liquor Only</a></li>
   </x:if>
   <x:if select="$dProfile/details/@GardenPatio !='N'">
      <li class="gardenPatio"><a href="">Garden/Patio</a></li>
   </x:if>
   <x:if select="$dProfile/details/@DanceFloor !='N'">
      <li class="danceFloor"><a href="">Dance Floor</a></li>
   </x:if>
   <x:if select="$dProfile/details/@BandDJAllowed !='N'">
      <li class="bandsDj"><a href="">Bands/DJ Allowed</a></li>
   </x:if>
   <x:if select="$dProfile/details/@Cake !='N'">
      <li class="canProvideCake"><a href="">Can Provide Cake</a></li>
   </x:if>
   <x:if select="$dProfile/details/@Valet !='N'">
      <li class="valetParking"><a href="">Valet Parking</a></li>
   </x:if>
   <x:if select="$dProfile/details/@FreeParking !='N'">
      <li class="freeParking"><a href="">Free Parking</a></li>
   </x:if>
   <x:if select="$dProfile/details/@SecurityRequired !='N'">
      <li class="securityRequired"><a href="">Security Required</a></li>
   </x:if>
   <x:if select="$dProfile/virtualTours/virtualTour">
      <li class="virtualTour"><a href="/<x:out select="$dProfile/@urlcompliantvendorname"/>/virtual-tours">Virtual Tour</a></li>
   </x:if>
   </ul>
</div>
</x:if>
</x:forEach>
</x:if>
<x:if select="$doc/WGBE/region/categories/category/@id='3'">
<x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet/profiles/profile" var="directoryProfile">
   <x:if select="$directoryProfile/details/@omit !='true'">
<div class="directory-block">
<h1><a href="/<x:out select="$directoryProfile/@urlcompliantvendorname"/>"><x:out select="$directoryProfile/@vendorName"/></a></h1>
   <ul>
      <x:if select="$directoryProfile/details/@AirportShuttle !='N'">
      <li class="airportShuttle"><a href="">Airport Shuttle</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@BreakfastIncluded !='N'">
      <li class="breakfastIncluded"><a href="">Breakfast Included</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@BusinessCenter !='N'">
      <li class="businessCenter"><a href="">Business Center</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Central !='N'">
      <li class="central"><a href="">Central</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@DiscountRoomBlocksAvailable !='N'">
      <li class="discountRoom"><a href="">Discount Room Blocks Available</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Downtown !='N'">
      <li class="downtown"><a href="">Downtown</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@East !='N'">
      <li class="east"><a href="">East</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@FitnessCenter !='N'">
      <li class="fitnessCenter"><a href="">Fitness Center</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@FreeParking !='N'">
      <li class="freeParking"><a href="">Free Parking</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@FreeWiFi !='N'">
      <li class="freeWifi"><a href="">Free WiFi</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@HandicapRoomsAvailable !='N'">
      <li class="handicapRoom"><a href="">Handicap Rooms Available</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Kitchenettes !='N'">
      <li class="kitchenettes"><a href="">Kitchenettes</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@MeetingRooms !='N'">
      <li class="meetingRoom"><a href="">Meeting Rooms</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Near6thStreetForAustin !='N'">
      <li class="near6th"><a href="">Near 6th Street in Austin</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@NearRiverwalkForSanAntonio !='N'">
      <li class="nearRiver"><a href="">Near Riverwalk in San Antonio</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@North !='N'">
      <li class="north"><a href="">North</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Northeast !='N'">
      <li class="northEast"><a href="">Northeast</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Northwest !='N'">
      <li class="northWest"><a href="">Northwest</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@PetFriendly !='N'">
      <li class="petFriendly"><a href="">Pet Friendly</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@RestaurantBaronSiteNearby !='N'">
      <li class="restaurantsNear"><a href="">Restaurant Baron Site Nearby</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@South !='N'">
      <li class="south"><a href="">South</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Southeast !='N'">
      <li class="southEast"><a href="">Southeast</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@Southwest !='N'">
      <li class="southWest"><a href="">Southwest</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@SuitesAvailable !='N'">
      <li class="suitesAvailable"><a href="">Suites Available</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@SwimmingPool !='N'">
      <li class="swimmingPool"><a href="">Swimming Pool</a></li>
      </x:if>
      <x:if select="$directoryProfile/details/@West !='N'">
      <li class="west"><a href="">West</a></li>
      </x:if>
   </ul>
</div>
   </x:if>
</x:forEach>
</x:if>