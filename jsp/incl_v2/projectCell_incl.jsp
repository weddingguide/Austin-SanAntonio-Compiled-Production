                  Projects:<br/>
                  <table width="100%" border=1 >
                     <x:forEach select="$contact/projects/project" var="project">
                        <tr>
                           <td style="border-top: 2px red solid">
                              <a href="/projectmanager/jsp/user/project.jsp?projectId=<x:out select="$project/@id"/>">
                                 <x:out select="$project/@name"/>
                              </a>
                           </td>
                           <td>
                              <div id=projectstatusRO<x:out select="$project/@id"/> style="display:block">
                                 <x:set var="htmltmp" select="string($project/statusHTML)"/>
                                 <c:out value="${htmltmp}" escapeXml="false"/>
                              </div>
                              <x:if select="$project/nextStateList">
                                   <br>
                                   <select id='projectstatus<x:out select="$project/@id"/>' onChange="updateStatus( this, <x:out select="$project/@id"/>)">
                                   <option value=-1>-- Select New Status --</option>
                                   <x:forEach select="$project/nextStateList/status" var="status" >
                                      <option value=<x:out select="$status/@id"/>><x:out select="$status/@name"/></option>
                                   </x:forEach>
                                </select>
                              </x:if>
                           </td>
                           <td>
                              <a href=/itemtrack/jsp/user/workitemlist.jsp?contact=<x:out select="$contact/@id"/>&project=<x:out select="$project/@id"/>>
                                 Work Items<br>
                              </a>
                              <x:forEach select="$project/workItemSummary/statusCounts/statusCount" var="cStatus" >
                                 <x:if select="$cStatus/@count!=0">
                                     <span class=<x:out select="$cStatus/@statusClass"/>>
                                        <x:out select="$cStatus/@count"/>-<x:out select="$cStatus/@status"/><br>
                                     </span>
                                 </x:if>
                              </x:forEach>
                           </td>
                        </tr>
                        <tr>
                           <td colspan=3>
                              <table border=1 width="100%">
                                 <x:forEach select="$project/events/event" var="event">
                                    <tr class="<x:out select="$event/@rowClass"/>">
                                       <td>
                                          <x:out select="$event/@bgnDate"/>
                                       </td>
                                       <td>
                                          <x:out select="$event/@description"/>
                                       </td>
                                       <td>
                                          <x:out select="$event/@location"/>
                                       </td>
                                    </tr>
                                 </x:forEach>
                              </table>
                           </td>
                        </tr>
                        <x:if select="$project/mailTemplates">
                           <tr>
                              <td colspan=3>
                                 <form action="sendContactEmail.jsp" method="get">
                                    <select name="templateId">
                                       <option value=-1>Select Email Template</option>
                                       <x:forEach select="$project/mailTemplates/template" var="template" >
                                          <option value=<x:out select="$template/@id"/>><x:out select="$template/@name"/></option>
                                       </x:forEach>
                                    </select>
                                    <input type="hidden" name="id" value="<x:out select="$contact/@id"/>">
                                    <input type="hidden" name="project" value="<x:out select="$project/@id"/>">
                                    <input type="submit" name="compose" value="Compose">
                                 </form>
                              </td>
                           </tr>
                        </x:if>
                     </x:forEach>
                  </table>


<script>
   function updateStatus( statusField, projectId )
   {
      var dataValue = statusField.value;
      var ajaxRequest = getAjaxRequestObject();

      ajaxRequest.open("GET", "/projectmanager/jsp/user/ajaxUpdateProjectInfo.jsp?attribute=status&value="+dataValue+'&projectId='+projectId+"&noLog", false);
      ajaxRequest.send(null);
      document.getElementById('projectstatusRO'+projectId).innerHTML = ajaxRequest.responseText;

      ajaxRequest.open("GET", "/projectmanager/jsp/user/ajaxGetNextStateDropdown.jsp?projectId="+projectId+"&noLog", false );
      ajaxRequest.send(null);
      document.getElementById('projectstatus'+projectId).innerHTML = ajaxRequest.responseText;

      return(true);
   }
</script>
