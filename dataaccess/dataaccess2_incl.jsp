<%
      // build the model data tree
      dataAccess = new WGBEXMLDataAccess( dbData, wgbeDataAccessCtrl );

      // build the DOM
      dataAccess.buildDOM();
      if ( request.getParameter( "debug" ) != null ) System.out.println( dataAccess.toXML() );

      // if requested... save xml in the session so we can come back later via a link to retrieve it
      if ( request.getParameter( "showXML" ) != null )
      {
         if ( request.getParameter( "showXML").equals( "link" ))
         {
            System.out.println( "Saving XML doc in session " + session.getId() );
            session.setAttribute( "xmlModel", dataAccess.toXML());
         }
      }

      request.setAttribute( "doc", dataAccess.getDoc());

      ((ServletDBData)dbData).close();
      dbData.getLog().logEvent( "Exit page" );
   }
   catch( Throwable e )
   {
      sysLogger.severe( e.toString() );
      e.printStackTrace( System.out );
   }
%>
