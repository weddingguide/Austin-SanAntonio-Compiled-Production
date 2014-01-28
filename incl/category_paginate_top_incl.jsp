<div class="paginate">
   <x:if select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/profileSet[@selected='true']/@randomstart='true'">
      <a href="<x:out select="$doc/WGBE/region/pagedata/currPageURL"/>?page=1">
         Show Alphabetically
      </a>
   </x:if>

   <x:if select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/@count>1">

      <a href="<x:out select="$doc/WGBE/region/pagedata/currPageURL"/>?all">
         Show All
      </a>
      &middot;

      <x:choose>
         <x:when select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/@selectprev">
            <a href="<x:out select="$doc/WGBE/region/pagedata/currPageURL"/>?page=<x:out select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/@selectprev"/>">
               <img src="/images/site/arrow-back.png" width="16" height="17" border="0" />
            </a>
         </x:when>
         <x:otherwise>
            <img src="/images/site/arrow-back-b.png" width="16" height="17" border="0" />
         </x:otherwise>
      </x:choose>
      &middot;

      <x:forEach select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/profileSet" var="pSet">
         <x:choose>
            <x:when select="$pSet/@selected='false'">
               <a href="<x:out select="$doc/WGBE/region/pagedata/currPageURL"/>?page=<x:out select="$pSet/@id"/>">
                  <x:out select="$pSet/@id"/>
               </a>
            </x:when>
            <x:otherwise>
               <x:out select="$pSet/@id"/>
            </x:otherwise>
         </x:choose>
         &middot;
      </x:forEach>

      <x:choose>
         <x:when select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/@selectnext">
            <a href="<x:out select="$doc/WGBE/region/pagedata/currPageURL"/>>?page=<x:out select="$doc/WGBE/region/categories/category[@selected='true']/profileSets/@selectnext"/>">
               <img src="/images/site/arrow-next.png" width="16" height="17" border="0" />
            </a>
         </x:when>
         <x:otherwise>
            <img src="/images/site/arrow-next-b.png" width="16" height="17" border="0" />
         </x:otherwise>
      </x:choose>
   </x:if>
</div>
<br class="clear" />
