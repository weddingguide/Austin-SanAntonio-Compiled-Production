<c:choose>
   <c:when test="${empty param.popup}">
   </c:when>
   <c:otherwise>
      <link href="/css/popup.css" rel="stylesheet" type="text/css" />
   </c:otherwise>
</c:choose>
