              <h1>Browse</h1>
                    <form action="#" method=get>
                        <h3>professionals by category</h3>
                        <select name="category" onchange="document.location=this.options[selectedIndex].value">
                            <x:if select="$doc/WGBE/region/categorysummary/@categoryselected">
                              <option value=0>Select a Category...</option>
                            </x:if>
                            <x:forEach select="$doc/WGBE/region/categorysummary/category" var="aCategory" >
                              <option <x:out select="$aCategory/selectedtext" /> value="<x:out select="$aCategory/@url"/>"> <x:out select="$aCategory/categorynames/categoryname/@name"/></option>
                            </x:forEach>
                        </select>
                      <input type="hidden" value="Find"/>
                    </form>
              