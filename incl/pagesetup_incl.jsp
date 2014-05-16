<%@page contentType="text/html;charset=UTF-8"%>


<%
   String url = request.getRequestURL().toString().toLowerCase();
   String region = "***";
   int businessId = -1;
   if ( url.indexOf( "austin" ) > -1 )
   {
      region = "Austin";
      businessId = 8671;
   }
   if ( url.indexOf( "sa"     ) > -1 )
   {
      region = "SA";
      businessId = 8672;
   }
   int texasWeddingsBusinessId = 8673;
%>

<%@ include file="imports_incl.jsp" %>
<%@ include file="../dataaccess/dataaccess1_incl.jsp" %>

<%
   String regionName           = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessId, 142, 0);
   String regionEmail          = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessId, 151, 0);
%>

<%@ include file="googleRemarketing_incl.jsp"%>
