   <x:if select="$doc/WGBE/region/categories/category/@search='false'">
      <div class="category-email">
         <a href="javascript:popUp('/contact.jsp?popup&category=<x:out select="$doc/WGBE/region/categories/category/@id" />&<x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name" />')">
            Click here to contact all wedding professionals in this category...
         </a>
      </div>
      <div class="head">
         <h1>
            <x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name" />
         </h1>
      </div>
   </x:if>
