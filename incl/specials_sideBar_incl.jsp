<script type="text/javascript">
    $(function() {
        $('#bookmarkme').click(function() {
            if (window.sidebar && window.sidebar.addPanel) { // Mozilla Firefox Bookmark
                window.sidebar.addPanel(document.title,window.location.href,'');
            } else if(window.external && ('AddFavorite' in window.external)) { // IE Favorite
                window.external.AddFavorite(location.href,document.title); 
            } else if(window.opera && window.print) { // Opera Hotlist
                this.title=document.title;
                return true;
            } else { // webkit - safari/chrome
                alert('Press ' + (navigator.userAgent.toLowerCase().indexOf('mac') != - 1 ? 'Command/Cmd' : 'CTRL') + ' + D to bookmark this page.');
            }
        });
    });
</script>
				<img src="/img/specials.png"/>
					<ul class="specialsNav">
						<li class="likeOnFacebook"><a href="<x:out select="$doc/WGBE/region/socialmedia/@facebook"/>">Like us on Facebook</a></li>
						<li class="registerInfo"><a href="/register.jsp">Register to receive info</a></li>
						<li class="bookmark"><a id="bookmarkme" href="#" title="bookmark this page">Bookmark this page</a></li>
					</ul>