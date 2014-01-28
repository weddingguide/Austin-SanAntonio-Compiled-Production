<%@ include file="duallist.js" %>
<%@ include file="setgroupvalues.jsp" %>

<% boolean groupsDisplayed = false; %>

<% if (( currGroups.getRecordList().length > 0 )||( availGroups.getRecordList().length > 0 ))  // if no groups avail, groups probably aren't support for this entity... just don't show the groups stuff
   {
         groupsDisplayed = true;
         if ( !readOnly )
         {
      %>
         <table border=0 class=tablebackground>
           <tr>
             <td>
               <div align="center">
                  <center>
                        <table border="0">
                           <tr>
<%    if (showAvailGroups ) { %>
                             <td>
                               Available Groups<br>
                               <select multiple size="10" style="width:250" name="listLeft" id="listLeft">
                               <%
                                  for ( int i = 0; i < availGroups.getRecordList().length; i++ )
                                  {
                                      EntityGroup aGroup = (EntityGroup) availGroups.getRecordList()[i];
                                      out.println( "<option value=\"" + aGroup.getGroupNum() + "\">" + aGroup.getName() + "</option>" );
                                  }
                               %>
                               </select>
                             </td>

                             <td>
                               <NOBR>
                               <input type="button" style="width:90" onclick="moveDualList( this.form.listLeft,  this.form.listRight, false )" name="Add     >>"  value="Add       >>">     <BR>
                               <NOBR>
                               <input type="button" style="width:90" onclick="moveDualList( this.form.listRight, this.form.listLeft,  false )" name="<<  Remove"  value="<<    Remove">     <BR>
                               <NOBR>
                             </td>
<% } %>
                             <td>
                               Member of:<br>
                               <select multiple size="10" style="width:250" name="listRight" id="listRight" onChange='updateDetailsLink( this.form );'>
                               <%
                                  for ( int i = 0; i < currGroups.getRecordList().length; i++ )
                                  {
                                      EntityGroup aGroup = (EntityGroup) currGroups.getRecordList()[i];
                                      out.println( "<option value=" + aGroup.getGroupNum() + ">" + aGroup.getName() + "</option>" );
                                  }
                               %>
                               </select>

                             </td>
                           </tr>
                        </table>
                  </center>
               </div>
            </td>
            <td>
               <input type=submit value="Details" disabled=true name=details_button onClick="return(openDetailsWindow( this.form ))">
            </td>
         </tr>
       </table>


      <% } else { %>
           <h4>Group Membership:</h4>
           <ul>
             <%
                for ( int i = 0; i < currGroups.getRecordList().length; i++ )
                {
                    EntityGroup aGroup = (EntityGroup) currGroups.getRecordList()[i];
                    out.println( "<li>" + aGroup.getName() );
                }
             %>
            </ul>
      <% } %>
<% } %>



