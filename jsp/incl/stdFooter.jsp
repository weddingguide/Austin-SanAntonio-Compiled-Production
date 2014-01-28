<%
   }    // end of main 'try' block
   catch( Exception e )
   {
      out.print( "An error has occurred on this page...: " + e );
      sysLogger.severe( pageTitle + "- Exception: " + e );
      e.printStackTrace( System.out );
   }
   finally
   {
      if ( dbData == null )
      {
         out.print( " -- dbData is null" );
         try
         {
//
//          SMTPClient smtpClient = new SMTPClient( "localhost",
//                                                  "JWMHostMonitor",
//                                                  "alert@JWMHosting.com",
//                                                  2125 );                  // <<========== IMPORTANT... using IIS SMTP Server to bypass JAMES in case of traffic backlog
//
//          smtpClient.sendMail( "Jerry",
//                               "5125897372@messaging.sprintpcs.com",
//                               "",
//                               "DBData is null - " +request.getRequestURL() + " - " + new Date(),
//                               "text/plain" );
         }
         catch( Exception e)
         {
//          sysLogger.severe( pageTitle + "dbData is null -- Exception: " + e );
            e.printStackTrace( System.out );
         }

      }
      else if ( dbData.getLog() == null )
      {
         out.print( "dbData.getLog() is null" );
         sysLogger.severe( "dbData.getLog() is null" );
      }
      else
      {
         dbData.getLog().logEvent( "closing connection" );
         ((ServletDBData)dbData).close();
      }
   }
%>
         <c:import url="/siteFooter.jsp" context="/webAppSiteSpecific" />
   </body>
</html>
