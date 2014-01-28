<a href="<x:out select="$doc/WGBE/region/@blog"/>"><img src="/img/bridalblog.png"/></a>
               <h3><x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname"/> Archive</h3>
               <ul>
               <x:forEach select="$doc/WGBE/region/blogPosts/blogPost" var="blogThread">
                  <li><a href="<x:out select="$blogThread/@link"/>">~<x:out select="$blogThread/@title"/></a></li>
                </x:forEach>
                </ul>