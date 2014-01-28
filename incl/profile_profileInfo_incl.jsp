<x:set select="$doc/WGBE/region/categories/category/profiles/profile" var="mProfile"/>
<x:set select="$doc/WGBE/region/categories/category" var="mCategory"/>
<img src="<x:out select="$mProfile/@avatarURL"/>" />
<h1><x:out select="$mProfile/@vendorName"/></h1>
<div class="profileFeatures"><a href="#pNav"><img src="http://austin.texasweddingsltd.net/img/arrow_pink.png" /> Profile Features</a></div>
<div class="breadCrumbs"><a href="<x:out select="$mCategory/@url"/>"><img src="http://austin.texasweddingsltd.net/img/arrow_pink.png" /> <x:out select="$mCategory/categorynames/categoryname/@name"/></a></div>
<x:forEach select="$doc/WGBE/region/categories/category/profiles/profile/ContactInfoSets/ContactInfo" var="mAddress">
<div class="address">
	<x:set var="pAddress" select="string($mAddress/address)"/><c:out value="${pAddress}" escapeXml="false"/> <br />
    <x:out select="$mAddress/phoneNumbers/phoneNumber/@number" />
</div>
</x:forEach>
<br class="clearfix" />
<div class="fb-like" data-width="300" data-show-faces="false" data-send="false"></div>