<x:set var="planningTools" select="string($doc/WGBE/region/staticcontentitems/staticcontent[@name='Planning Tools']/content)"/>
<c:out value="${planningTools}" escapeXml="false"/>
