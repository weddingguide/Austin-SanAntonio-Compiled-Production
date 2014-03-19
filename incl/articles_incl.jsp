<div class="articles-info">
	<h1>Articles</h1>
	<div>
		<span>
			<a href="planning-tools.jsp"><img src="img/arrow_pink.png" /> Back to Planning Tools</a>
		</span>
	</div>
	<p>Read through the articles below for helpful information regarding almost every aspect of your wedding, from questions of etiquette to the fine details of planning your perfect day. Feel free to contact us at <a href="mailto:weddingguide@texasweddings.com">weddingguide@texasweddings.com</a> if you have any questions about an article, or something that isn't covered below. Stay tuned for more articles!</p>
</div>
<div class="articles-nav">
	<strong>Categories:</strong>
	<ul>
		<li><a href="#first-steps">The First Steps</a></li>
		<li><a href="#celebration">The Celebration</a></li>
		<li><a href="#finery">The Finery</a></li>
		<li><a href="#images">The Images</a></li>
		<li><a href="#entertainment">The Entertainment</a></li>
		<li><a href="#beauty">The Beauty</a></li>
	</ul>
</div>
<div class="articles-container">
	<div class="article-block" id="first-steps">
		<a href="#"><img src="img/articles_firststeps.png"/></a>
		<ul>
		<x:forEach select="$doc/WGBE/region/articleSets/articles" var="filteredArticle">
		<x:if select="$filteredArticle/@setname = 'First Steps'">
			<x:forEach select="$filteredArticle/article" var="firstSteps">
				<li><a href="article.jsp?id=<x:out select="$firstSteps/@id"/>"><x:out select="$firstSteps/@title"/></a></li>
			</x:forEach>
		</x:if>
		</x:forEach>
		</ul>
	</div>
	<div class="article-block" id="celebration">
		<a href="#"><img src="img/articles_celebration.png"/></a>
		<ul>
		<x:forEach select="$doc/WGBE/region/articleSets/articles" var="filteredArticle">
		<x:if select="$filteredArticle/@setname = 'Celebration'">
			<x:forEach select="$filteredArticle/article" var="celebration">
				<li><a href="article.jsp?id=<x:out select="$celebration/@id"/>"><x:out select="$celebration/@title"/></a></li>
			</x:forEach>
		</x:if>
		</x:forEach>
		</ul>
	</div>
	<div class="article-block" id="finery">
		<a href="#"><img src="img/articles_finery.png"/></a>
		<ul>
		<x:forEach select="$doc/WGBE/region/articleSets/articles" var="filteredArticle">
		<x:if select="$filteredArticle/@setname = 'Finery'">
			<x:forEach select="$filteredArticle/article" var="finery">
				<li><a href="article.jsp?id=<x:out select="$finery/@id"/>"><x:out select="$finery/@title"/></a></li>
			</x:forEach>
		</x:if>
		</x:forEach>
		</ul>
	</div>
	<div class="article-block" id="images">
		<a href="#"><img src="img/articles_images.png"/></a>
		<ul>
		<x:forEach select="$doc/WGBE/region/articleSets/articles" var="filteredArticle">
		<x:if select="$filteredArticle/@setname = 'Images'">
			<x:forEach select="$filteredArticle/article" var="images">
				<li><a href="article.jsp?id=<x:out select="$images/@id"/>"><x:out select="$images/@title"/></a></li>
			</x:forEach>
		</x:if>
		</x:forEach>
		</ul>
	</div>
	<div class="article-block" id="entertainment">
		<a href="#"><img src="img/articles_entertainment.png"/></a>
		<ul>
		<x:forEach select="$doc/WGBE/region/articleSets/articles" var="filteredArticle">
		<x:if select="$filteredArticle/@setname = 'Entertainment'">
			<x:forEach select="$filteredArticle/article" var="entertainment">
				<li><a href="article.jsp?id=<x:out select="$entertainment/@id"/>"><x:out select="$entertainment/@title"/></a></li>
			</x:forEach>
		</x:if>
		</x:forEach>
		</ul>
	</div>
	<div class="article-block" id="beauty">
		<a href="#"><img src="img/articles_beauty.png"/></a>
		<ul>
		<x:forEach select="$doc/WGBE/region/articleSets/articles" var="filteredArticle">
		<x:if select="$filteredArticle/@setname = 'Beauty'">
			<x:forEach select="$filteredArticle/article" var="beauty">
				<li><a href="article.jsp?id=<x:out select="$beauty/@id"/>"><x:out select="$beauty/@title"/></a></li>
			</x:forEach>
		</x:if>
		</x:forEach>
		</ul>
	</div>
</div>

