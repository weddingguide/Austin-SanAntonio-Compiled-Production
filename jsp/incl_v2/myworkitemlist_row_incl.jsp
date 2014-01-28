                  <x:if select="$thisWorkItem/@editable='true'">
                     <a href="/itemtrack/jsp/user/workitem.jsp?id=<x:out select="$thisWorkItem/@id"/>">
                        <span class="<x:out select="$thisWorkItem/@viewedClass"/>">
                  </x:if>
                        <x:out select="$thisWorkItem/@description"/>
                  <x:if select="$thisWorkItem/@editable='true'">
                        </span>
                     </a>
                  </x:if>
               </td>
               <td>
                  <a href="/itemtrack/jsp/user/workitemlist.jsp?project=<x:out select="$thisWorkItem/@projectId"/>&contact=<x:out select="$thisWorkItem/@contactId"/>">
                     <img src="/images/list1.jpg" border=0 width=18>
                  </a>
               </td>

