<%
      // build the model data tree
      dataAccess = new WGBEXMLDataAccess( dbData, wgbeDataAccessCtrl );

      // build the DOM
      dataAccess.buildDOM();
       // if requested... save xml in the session so we can come back later via a link to retrieve it
         if ( showXML.equals( "link" ))
         {
            session.setAttribute( "xmlModel", dataAccess.toXML());
         }
         else if ( showXML.equals( "sys" ))
         {
            System.out.println( "XML: " + dataAccess.toXML() );
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
