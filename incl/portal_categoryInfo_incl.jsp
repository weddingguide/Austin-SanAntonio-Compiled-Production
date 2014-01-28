<x:if select="$doc/WGBE/region/categories/category/@search='false'">
<img src="/galleries/<x:out select="$doc/WGBE/region/categories/category/@id"/>/<x:set var="cThumbnail" select="string($doc/WGBE/region/categories/category/thumbnails)"/><c:out value="${cThumbnail}" escapeXml="false"/>"/>
        <div>
                <h1><x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name" /></h1><span><a href="<x:out select="$doc/WGBE/region/categories/category/@url"/>/?noportal=true"><img src="http://austin.texasweddingsltd.net/img/arrow_pink.png"/> View wedding professionals</a></span>
                <br class="clearfix" />
                <x:set var="cDescription" select="string($doc/WGBE/region/categories/category/description)"/>
                <c:out value="${cDescription}" escapeXml="false"/>
        </div>  
</x:if>