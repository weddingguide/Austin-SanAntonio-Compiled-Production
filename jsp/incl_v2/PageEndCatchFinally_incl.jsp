<%
   }    // end of main 'try' block
   catch( Exception e )
   {
      out.print( "An error has occurred on this page...: " + e );
      System.out.println( new java.util.Date() + " Page exception: " + request.getRequestURL() );
      e.printStackTrace( System.out );
      sysLogger.severe( e.toString() );
   }
   finally
   {
      if (showLog.equals( "true" ) )
      {
%>
         &nbsp;
         <textarea style="font-size:10px; width:100%" rows=20><%= ((BufferLog) dbData.getLog()).getLogData()%></textarea>
<%
      }

      if ( dbData == null )
      {
         out.print( " -- dbData is null" );
         try
         {

            SMTPClient smtpClient = new SMTPClient( "localhost",
                                                    "JWMHostMonitor",
                                                    "alert@JWMHosting.com",
                                                    2125 );                  // <<========== IMPORTANT... using IIS SMTP Server to bypass JAMES in case of traffic backlog

            smtpClient.sendMail( "Jerry",
                                 "5125897372@messaging.sprintpcs.com",
                                 "",
                                 "DBData is null - " +request.getRequestURL() + " - " + new Date(),
                                 "text/plain" );
         }
         catch( Exception e)
         {
            e.printStackTrace( System.err );
         }

      }
      else if ( dbData.getLog() == null )
      {
         out.print( "dbData.getLog() is null" );
      }
      else
      {
         dbData.getLog().logEvent( "closing connection" );
         ((ServletDBData)dbData).close();
      }
   }
%>
