<%
   String breadcrumb = "";

   if ( request.getParameter( "clear" ) == null )
   {
      Cookie[] cookies = request.getCookies();
      if ( cookies != null )
      {
         for ( int i = 0; i < cookies.length; i++ )
         {
            if (cookies[i].getName().equals( "breadcrumb" ))
            {
                breadcrumb = cookies[i].getValue();
            }
         }
      }
   }
   else
   {
      // clear breadcrumb
      if ( response.isCommitted() ) System.out.println( "*** Error Setting Breadcrumb Cookie in breadcrumbs.jsp - response is already committed.  Increase resp buffer size ***" );

      Cookie cBreadcrumb = new Cookie( "breadcrumb", "---" );
      cBreadcrumb.setPath( "/" );
      response.addCookie( cBreadcrumb );
   }

   if ( !breadcrumb.equals("---") )
   {
%>
      <li><%=breadcrumb%></li>
<%
   }
%>
