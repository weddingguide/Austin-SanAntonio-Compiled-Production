<%   {
          String galleryRootURL = SiteProperty.valueOf( dbData, "attributeResourcesGalleryRootURL", "** attributeResourcesGalleryRootURL SiteProperty not defined**" );
          try
          {
%>
               <% if (attributeDef.getSubId() == 0 ) { %>
                 <td colspan=2 width="20%">
               <% } else { %>
                 <td>&nbsp;&nbsp;&nbsp;</td>
                 <td>
               <% } %>
                     <% if (( attributeNdx > -1) || (attributeDef.getSubId() > 0 ))
                        {
                           out.print( attributeDef.getPrompt() + " [" + (attributeNdx+1) + "]" );
                        }
                     %>
                 </td>
                 <td>
                    <% if ( attributeDef.getType() == EntityAttributeDef.TYPE_INT ) { %>
                             <input name=<%=attributeName%> value="<%=attribute.getAttributeData()%>" onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')"> (numeric value only)
                    <% } else if ( attributeDef.getType() == EntityAttributeDef.TYPE_PARAGRAPHTEXT ) { %>
                             <textarea name=<%=attributeName%> rows=8 cols=70 onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')"><%=attribute.getAttributeData()%></textarea>
                    <% } else if ( attributeDef.getType() == EntityAttributeDef.TYPE_IMAGE ) { %>
                             <%
                                       if ( ( attribute.getAttributeData().toUpperCase().indexOf( ".JPG" ) > 0 )
                                          ||( attribute.getAttributeData().toUpperCase().indexOf( ".GIF" ) > 0 ))
                                       {
                             %>
                                          <img src="<%=galleryRootURL%><%=ownerType%>/<%=ownerId%>/<%=attribute.getAttributeData()%>" width=75>
                             <%        }
                             %>
                             <input  name=<%=attributeName%> id=<%=attributeName%> value="<%=attribute.getAttributeData()%>" onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')">

                    <% } else if ( attributeDef.getType() == EntityAttributeDef.TYPE_DATE ) { %>

                         <% SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd"); %>
                         <% Calendar cal = Calendar.getInstance(); %>
                         <% try
                            {
                               cal.setTime( dateFormat.parse( attribute.getAttributeData() ) );
                            }
                            catch( ParseException pe )
                            {
                               cal.setTime( new java.util.Date() ); // if attribute value 'date' is invalid in any way, just use 'today'
                            }
                         %>
                         <% int theYear = cal.get( Calendar.YEAR );  %>
                         <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                         <% int theDay = cal.get( Calendar.DATE );  %>
                         <% String datePrefix = attributeName; %>
                         <% String attributeProperty = "dateAttribute"; %>
                         <% String dateSuffix = ""; %>
                         <% String setDaysFn = "setDaysSingle"; %>
                         <% int theMinute = 0; %>
                         <% int theAMPM = 0; %>
                         <% int numDays; %>
                         <% String ajaxParmsOrig = ajaxParms;
                            ajaxParms += ajaxParmsOrig+"&attributeProperty="+attributeProperty;
                            ajaxParms = ajaxParmsOrig;
                         %>
                         <%@ include file="entityattribute_date_incl.jsp" %>

                    <% } else if ( attributeDef.getType() == EntityAttributeDef.TYPE_BOOLEAN ) { %>
                             <input type=checkbox <% if (attribute.getAttributeData().equals("checked")) out.print( " checked " ); %> name=<%=attributeName%> value="checked" onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')">

                    <% } else if ( attributeDef.getType() == EntityAttributeDef.TYPE_SELECTION )
                    {
                       EntityAttributeList selectionValues = new EntityAttributeList(dbData, EntityAttributeDef.OWNERTYPE_ATTRIBUTEDEF, 0, attributeDef.getId(), attributeDef.getSubId());
                    %>
                             <select name=<%=attributeName%> onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')">
                    <%
                       for (int opt = 0; opt<selectionValues.getRecordList().length; opt++)
                       {
                          EntityAttribute selectionValue = (EntityAttribute) selectionValues.getRecordList()[opt];
                    %>
                                <option value="<%=selectionValue.getAttributeData()%>" <% if (selectionValue.getAttributeData().equals( attribute.getAttributeData()) ) out.print( " SELECTED " ); %>><%=selectionValue.getAttributeData()%></option>
                    <% } %>
                             </select>
                    <% } else {                                                          %>
                       <% if ( attribute.getAttributeData().indexOf( "\"") == -1 ) // no double quotes in data, use double quotes in html
                          {
                       %>
                             <input  name=<%=attributeName%> size=40 value="<%=attribute.getAttributeData()%>" onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')">
                       <% }
                          else
                          {
                       %>
                             <input  name=<%=attributeName%> size=40 value='<%=attribute.getAttributeData()%>' onChange="ajaxAttributeUpdate(this.form, '<%=attributeName%>', <%=attributeDef.getType()%>, '<%=ajaxParms%>', 'dataValue')">
                       <% } %>
                    <% } %>
                 </td>
                 <td>
                   <span style="font-size: 10px">
                    <% if ( attributeDef.getType() == EntityAttributeDef.TYPE_IMAGE ) { %>
                             <input type=submit name=button1 id=button1 value="Browse Gallery"  onClick="rc=popupPage( '<%=attributeName%>' ); return(rc);">
                    <% } else {                                                          %>
                             &nbsp;
                    <% } %>

                <% if (attributeDef.getDateRestricted() > 0)  { %>
                 <br>Bgn:
                   <% { %>
                    <% Calendar cal = Calendar.getInstance(); %>
                    <% cal.setTime( attribute.getBgnDate() ); %>
                    <% int theYear = cal.get( Calendar.YEAR );  %>
                    <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                    <% int theDay = cal.get( Calendar.DATE );  %>
                    <% String datePrefix = attributeName+"_bgnDate"; %>
                    <% String attributeProperty = "bgnDate"; %>
                    <% String dateSuffix = ""; %>
                    <% String setDaysFn = "setDaysSingle"; %>
                    <% int theMinute = 0; %>
                    <% int theAMPM = 0; %>
                    <% int numDays; %>
                    <% String ajaxParmsOrig = ajaxParms;
                       ajaxParms += ajaxParmsOrig+"&attributeProperty="+attributeProperty;
                       ajaxParms = ajaxParmsOrig;
                    %>
                    <%@ include file="entityattribute_date_incl.jsp" %>
                   <% } %>
                      <br>End:
                   <% { %>
                    <% Calendar cal = Calendar.getInstance(); %>
                    <% cal.setTime( attribute.getEndDate() ); %>
                    <% int theYear = cal.get( Calendar.YEAR );  %>
                    <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                    <% int theDay = cal.get( Calendar.DATE );  %>
                    <% String datePrefix = attributeName+"_endDate"; %>
                    <% String attributeProperty = "endDate"; %>
                    <% String dateSuffix = ""; %>
                    <% String setDaysFn = "setDaysSingle"; %>
                    <% int theMinute = 0; %>
                    <% int theAMPM = 0; %>
                    <% int numDays; %>
                    <% String ajaxParmsOrig = ajaxParms;
                       ajaxParms += ajaxParmsOrig+"&attributeProperty="+attributeProperty;
                       ajaxParms = ajaxParmsOrig;
                    %>
                    <%@ include file="entityattribute_date_incl.jsp" %>
                   <% } %>
                 <% } %>
                    </span>
                 </td>
                 <td>
                    <% String ajaxCallDelete = "onClick=\"rmvAttribute(this.form, '"+attributeName+"', '"+attributeDef.getType()+"', '"+ajaxParms+"', '"+tableId+"', '"+attributeDef.getId()+"','"+attributeDef.getSubId()+"',"+attributeNdx+"); return(false);\""; %>
                    <a href=# <%=ajaxCallDelete%>><img border=0 src="/images/b_drop.png"></a>
                 </td>
<%    }
      catch( Exception e)
      {
         out.print(e);
         e.printStackTrace( System.out );
      }
   }
%>
