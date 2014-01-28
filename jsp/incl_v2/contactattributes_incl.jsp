   <h3>Event Details</h3>
   <%
      int defOwnerType = ObjectClassID.CONTACT;
      int defOwnerId = 0;
      int ownerType = ObjectClassID.CONTACT;
      int ownerId = aContact.getId();

      EntityAttributeDefList attributeDefList = new EntityAttributeDefList(dbData, "OWNERTYPE = " + defOwnerType + " AND OWNERID="+defOwnerId + " AND SUBID=0", "SORTWEIGHT ASC");
      String tableId = "AttributesTable";
   %>
      <%@ include file="ajaxScript_incl.jsp" %>
      <%@ include file="manageoneattributeset_incl.jsp" %>
<hr>
