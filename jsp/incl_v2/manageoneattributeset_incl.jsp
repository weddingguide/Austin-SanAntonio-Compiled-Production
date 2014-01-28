<% { // for scoping of all variables %>
   <form id=attributeForm action="#">
      <table width="100%" border=1 id=<%=tableId%>>
<%
      EntityAttribute attribute = null;

      for (int j=0; j < attributeDefList.getRecordList().length; j++ )
      {
         EntityAttributeDef attributeDef = (EntityAttributeDef) attributeDefList.getRecordList()[j];

         // now get all of the attribute and subattribute defs for this one attribute
         EntityAttributeDefList attributeDefGroup = new EntityAttributeDefList(dbData, "OWNERTYPE = " + defOwnerType + " AND ID="+attributeDef.getId(), "SUBID ASC");

         EntityAttributeList  valuesForPrimaryAttribute = new EntityAttributeList(dbData, ownerType, ownerId, attributeDef.getId(), 0);

%>
         <tr class=row1 id="row_<%=attributeDef.getId()%>">
            <td colspan=6>
               <%=attributeDef.getPrompt()%> (<%=valuesForPrimaryAttribute.getRecordList().length%>)
               <%
               if (((attributeDef.getCardinality()==1) && (valuesForPrimaryAttribute.getRecordList().length == 0))
                   || (attributeDef.getCardinality() != 1))
               {
                  String ajaxParms="id="+attributeDef.getId()+"&subId=0";
                  String ajaxCall = "onClick=\"addAttributeInstance(this.form, '"+attributeDef.getPrompt().replace("'","_")+"', '"+attributeDef.getType()+"', '"+ajaxParms+"', '"+tableId+"', '"+attributeDef.getId()+"', 0, 0); return(false);\"";
               %>
                  <a href=# <%=ajaxCall%>>[add]</a>
               <%
               }
               %>
            </td>
         </tr>
<%
         for ( int i1=0; i1 < valuesForPrimaryAttribute.getRecordList().length; i1++ )
         {
           attributeDef = (EntityAttributeDef) attributeDefList.getRecordList()[j];
           attribute = (EntityAttribute) valuesForPrimaryAttribute.getRecordList()[i1];
           int attributeNdx  = attribute.getNdx();
           String attributeName = "attr_" + attributeDef.getId()+"_"+attributeDef.getSubId()+"_"+attribute.getNdx();
           String ajaxParms="id="+attributeDef.getId()+"&subId="+attributeDef.getSubId()+"&instance="+attribute.getNdx();
           String rowIdPrefix = "row_"+ attributeDef.getId()+"_"+attributeDef.getSubId();
           String rowId = rowIdPrefix+"_" + attributeNdx;
%>
           <tr id='<%=rowId%>' class=row0>
              <%@ include file="attribute_entry_incl.jsp" %>
           </tr>
<%
           String addString = "";
           for (int k=1; k < attributeDefGroup.getRecordList().length; k++ ) //now walk subattributes (skip first entry which is the primary
           {
              attributeDef = (EntityAttributeDef) attributeDefGroup.getRecordList()[k];

              attribute = new EntityAttribute( dbData, ownerType, ownerId, attributeDef.getId(), attributeDef.getSubId(), attributeNdx  );
              attributeName = "attr_" + attributeDef.getId()+"_"+attributeDef.getSubId()+"_"+attributeNdx;
              ajaxParms="id="+attributeDef.getId()+"&subId="+attributeDef.getSubId()+"&instance="+attributeNdx;
              String ajaxCall = "onClick=\"addSubAttribute(this.form, '"+attributeName+"', '"+attributeDef.getType()+"', '"+ajaxParms+"', '"+tableId+"', '"+attributeDef.getId()+"', '"+attributeDef.getSubId()+"', '"+attributeNdx+"'); return(false);\"";
              rowIdPrefix = "row_"+ attributeDef.getId()+"_"+attributeDef.getSubId();
              rowId = rowIdPrefix+"_" + attributeNdx;

              if ( attribute.isRecordFound() )
              {
%>
                  <tr id=<%=rowId%>>
                    <%@ include file="attribute_entry_incl.jsp" %>
                 </tr>
<%
               }
               else
               {
                  addString += " | [add <a href=# " + ajaxCall + ">" + attributeDef.getPrompt() + "</a>]";
               }
           } // k loop
           if ( addString != "" )
           {
%>
                 <tr class=row0 id="row_<%=attributeDef.getId()%>_9999_<%=attributeNdx%>">
                    <td colspan=5>
                      <font size=-1 color=gray><i><%=addString%></i></font>
                    </td>
                 </tr>
<%         }
%>
      <% } // i1 loop %>
   <% } // j loop %>
   </table>
 </form>
<% } %>
