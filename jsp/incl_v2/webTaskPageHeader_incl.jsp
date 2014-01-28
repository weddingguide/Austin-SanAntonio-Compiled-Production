<%@ include file="PageDefaults.jsp" %>
<%@ include file="../incl_v2/AjaxPageHeader_incl.jsp" %>
<%
   try
   {
      if ( request.getUserPrincipal() == null )
      {
         request.login( request.getParameter( "username" ), request.getParameter( "pwd" ) );
      }
      dbData.getLog().logEvent( "Login succeeded" );

      // only do the work if login succeeded...
%>
