<div class="listing-containter">
   <x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet/profiles/profile" var="cProfile">

      <div class="listing">

         <div class="right">

            <div class="head">
               <div>
                  <a href="/<x:out select="$cProfile/@urlcompliantvendorname"/>">
                     <x:out select="$cProfile/@vendorName"/>
                  </a>
               </div>
            </div>

            <div class="body">
               <div class="category-crop">
                  <x:out select="$cProfile/address"/>
                  <br/>

                  <x:forEach select="$cProfile/phonenumbers" var="phoneNum">
                     <x:out select="$phoneNum"/>
                     <br/>
                  </x:forEach>


                  <p>
                     <x:set var="htmltmp" select="string($cProfile/abstract)"/>
                     <c:out value="${htmltmp}" escapeXml="false"/>
                  </p>
               </div>

               <a href="/<x:out select="$cProfile/@urlcompliantvendorname"/>">
                  More...
               </a>
            </div>

         </div>

         <div class="left">
            <a href="/<x:out select="$cProfile/@urlcompliantvendorname"/>">
               <x:set var="htmltmp" select="string($cProfile/avatartag)"/>
               <c:out value="${htmltmp}" escapeXml="false"/>
            </a>
         </div>

      </div>
   </x:forEach>
</div>
