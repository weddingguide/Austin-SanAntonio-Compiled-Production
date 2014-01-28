                <hgroup class="branding" style="background:url(http://texasweddingsltd.com<x:out select="$doc/WGBE/region/@headerbackground"/>);">
                    <a href="/"><x:if select="$doc/WGBE/region/@name='SA'"><img src="http://texasweddingsltd.com/galleries/8672/logo_sa.png"></x:if><x:if select="$doc/WGBE/region/@name='Austin'"><img src="http://texasweddingsltd.com/galleries/8671/logo_atx.png"/></x:if></a>
                    <div class="header-book">
                        <a href="<x:out select="$doc/WGBE/region/@virtualbooklink"/>"><img src="<x:out select="$doc/WGBE/region/@headermag"/>" height="107" width="69" alt="Wedding Guide Magazine"/></a>
                        <a href="/content.jsp?attrId=67"><img src="http://austin.texasweddingsltd.net/img/wg_findit.png"/></a>
                        <a href="<x:out select="$doc/WGBE/region/@virtualbooklink"/>"><img src="http://austin.texasweddingsltd.net/img/wg_readit.png"/></a>
                    </div>
                </hgroup>
                <hgroup class="search">
                    <%@ include file="VendorCategorySelection_incl.jsp" %>
                    <%@ include file="VendorSearch_incl.jsp" %>
                </hgroup>
                
                <nav>
                    <a href="#" id="pull">Menu</a> 
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="<x:out select="$doc/WGBE/region/@bridalextravaganza"/>">Bridal Extravaganza</a></li>
                        <li><a href="<x:out select="$doc/WGBE/region/@blog"/>">Bridal Blog</a></li>
                        <li><a href="/specials.jsp">Specials</a></li>
                        <li><a href="/events.jsp">Shows &amp; Events</a></li>
                        <li><a href="/planning-tools.jsp">Planning Tools</a>
                        </li>
                        <li><a href="/register.jsp">SIGN UP FREE!</a></li>
                    </ul>    
                </nav>