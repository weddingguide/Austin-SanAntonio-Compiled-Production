<%
   pageTitle = pageTitle.replaceAll( "%1", pageTitleVar );
   if ( jspUtils.getParameter( "noheader" ) == null )
   {
      request.setAttribute( "pageTitle", pageTitle );
   }
// if ( ( (String) request.getAttribute( "pageTitleDisplayed")).equals("true")) pageTitleDisplayed=true;
// boolean pageTitleDisplayed = false; // need to know if siteHeader displays the H1 page title
// request.setAttribute( "pageTitleDisplayed", "false" );
%>
