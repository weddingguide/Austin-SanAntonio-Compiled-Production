<%
      DBData dbData = null;
      Logger sysLogger = null;

      DataAccess dataAccess = null;

      String logLevel = JSPUtils.getPersistentParameter( request, response, "logLevel", "INFO" );
      String showXML = JSPUtils.getPersistentParameter( request, response, "showXML", "false" );
      String showLog = JSPUtils.getPersistentParameter( request, response, "showLog", "false" );

      String url = request.getRequestURL().toString().toLowerCase();
      String site = null;

      if ( url.indexOf( "2ndgenfilms." ) > -1 ) site = "wedding";
      if ( url.indexOf( "2ndgenparty." ) > -1 ) site = "party";
      if ( url.indexOf( "2ndgenprod." ) > -1 ) site = "more";
      if ( url.indexOf( "samidith" ) > -1 ) site = "samidith";
      if ( url.indexOf( "stpaul" ) > -1 ) site = "stpaulspeaks";
      if ( url.indexOf( "texaswed" ) > -1 ) site = "wgbe";

      int domainId = -1;
      if ( url.indexOf( "2ndgenfilms." ) > -1 ) domainId = 1;
      if ( url.indexOf( "2ndgenparty." ) > -1 ) domainId = 2;
      if ( url.indexOf( "2ndgenprod." ) > -1 )  domainId = 3;
      if ( url.indexOf( "samidith" ) > -1 )     domainId = 4;
      if ( url.indexOf( "texaswed" ) > -1 )     domainId = 5;
      if ( url.indexOf( "stpaulspeaks" ) > -1 )     domainId = 6;

      String siteName = "";
      if ( url.indexOf( "2ndgenfilms." ) > -1 ) siteName = "2nd Generation Wedding Films";
      if ( url.indexOf( "2ndgenparty." ) > -1 ) siteName = "2nd Generation Party Videos";
      if ( url.indexOf( "2ndgenprod." ) > -1 )  siteName = "2nd Generation Video Productions";
      if ( url.indexOf( "samidith" ) > -1 )     siteName = "Sam & Meredith";
      if ( url.indexOf( "texaswed" ) > -1 )     siteName = "Wedding Guide & Bridal Extraganza";
      if ( url.indexOf( "stpaulspeaks" ) > -1 )     siteName = "St Paul Speaks";

      boolean localSite= false;
      boolean stagingSite = false;

      if ( url.indexOf( "local." ) > -1 ) localSite = true;
      else if ( url.indexOf( ".net" ) > -1 ) stagingSite = true;

      pageTitle = pageTitle.replaceAll( "%siteName%", siteName ); // just in case the page wants to customize its title by site


      System.out.println( url + " =====  " + site );

      if ( site == null ) // no URL parm, should be in a cookie
      {
         if ( request.getCookies() != null )
         {
            for ( int i = 0; i < request.getCookies().length; i++ )
            {
               Cookie cookie = request.getCookies()[i];
               if (cookie.getName().equals( "site" ))
               {
                  site = cookie.getValue();
               }
            }
         }
      }
      if (site == null ) site = "wedding";  // final fallback...

      response.addCookie( new Cookie( "site", site )); // send the site cookie for future reference

      System.out.println( "Default Response Buffer Size: " + response.getBufferSize() );
      response.setBufferSize( 25000 );

      System.out.println( "New Response Buffer Size: " + response.getBufferSize() );

      JSPUtils jspUtils = new JSPUtils( request, response );
      CallBack self = new CallBack( request, jspUtils, "" );

      boolean printable = false;
      if ( request.getParameter( "printable" ) != null ) printable = true;
%>
