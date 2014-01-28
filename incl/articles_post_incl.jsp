<div class="articles-info">
	<h1><x:out select="$doc/WGBE/region/articleSets/articles/article/@title"/></h1>
	<div>
		<span>
			<a href="javascript:history.go(-1)"><img src="img/arrow_pink.png" /> Back to Planning Tools</a>
		</span>
	</div>
</div>
<div class="articles-nav">
	<strong>Categories:</strong>
	<ul>
		<li><a href="articles.jsp#first-steps">The First Steps</a></li>
		<li><a href="articles.jsp#celebration">The Celebration</a></li>
		<li><a href="articles.jsp#finery">The Finery</a></li>
		<li><a href="articles.jsp#images">The Images</a></li>
		<li><a href="articles.jsp#entertainment">The Entertainment</a></li>
		<li><a href="articles.jsp#beauty">The Beauty</a></li>
	</ul>
</div>
<div class="articles-container">
	<div>
	<strong>Tags:</strong> <x:out select="$doc/WGBE/region/articleSets/articles/article/tags"/>
	</div>
	<x:set var="articleContent" select="string($doc/WGBE/region/articleSets/articles/article/parts/part/content)"/>
    <c:out value="${articleContent}" escapeXml="false"/>
</div>

