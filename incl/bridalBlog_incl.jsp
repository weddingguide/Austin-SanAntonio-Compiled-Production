			<div class="bridal-blog">
				<img src="img/bridalblog.png" />
				<div><a href="<x:out select="$doc/WGBE/region/@blog"/>"><img src="img/arrow_pink.png" /> Visit the Bridal Blog</a><br />
				<a style="display:none;" href="#"><img src="img/arrow_pink.png" /> Submit a Love Story!</a></div>
				<x:forEach select="$doc/WGBE/region/blogPosts/blogPost" var="blogThread">
				<h3><a href="<x:out select="$blogThread/@link"/>"><x:out select="$blogThread/@title"/></a><br /><small><x:out select="$blogThread/@pubdate"/></small></h3>
				<p><x:set var="blogAbstract" select="string($blogThread/abstract)"/><c:out value="${blogAbstract}" escapeXml="false"/>[<a href="<x:out select="$blogThread/@link"/>">continue</a>]</p>

				</x:forEach>
			</div>