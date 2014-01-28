<h2>Map</h2>
<x:set var="pMap" select="string($doc/WGBE/region/categories/category/profiles/profile/map/@url)"/>
<c:out value="${pMap}" escapeXml="false"/>