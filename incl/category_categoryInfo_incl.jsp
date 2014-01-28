<x:if select="$doc/WGBE/region/categories/category/@search='false'">
        <h1><x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name" /></h1>
        <div>
                <span><a href="category_contact.jsp?category=<x:out select="$doc/WGBE/region/categories/category/@id" />" onclick="return popUp('category_contact.jsp?category=<x:out select="$doc/WGBE/region/categories/category/@id" />')"><img src="/img/arrow_pink.png" /> Contact all professionals from this category</a></span>
                <span><a href="?noportal=true&page=1"><img src="/img/arrow_pink.png" /> View alphabetically</a></span>
                <x:if select="$doc/WGBE/region/categories/category/@usePortalPage='true'">
                        <span><a href="<x:out select="$doc/WGBE/region/categories/category/@url"/>"><img src="/img/arrow_pink.png" /> Back to Portal</a></span>
                </x:if>
                <br />
                <x:if select="$doc/WGBE/region/categories/category/profileSets/@paginate='true'">
                        <x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet" var="profileSet">
                                <span><img src="/img/arrow_pink.png" /> <a href="?noportal=true&page=<x:out select="$profileSet/@id"/>">Page <x:out select="$profileSet/@id"/></a></span>
                        </x:forEach>
                </x:if>
        </div>
        <p>
                <x:set var="cDescription" select="string($doc/WGBE/region/categories/category/description)"/>
                <c:out value="${cDescription}" escapeXml="false"/>
        </p>
</x:if>
