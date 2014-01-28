<%


   // include code that requires a dbData object here.  this is included in AppHeader after dbData defined

   sysLogger = dbData.getLog().getSysLogger("JSP: " + pageTitle);

   String theUserId = "Guest";
   if ( request.getUserPrincipal() != null )
   {
      theUserId = request.getUserPrincipal().getName();
   }
   dbData.setCurrUserName( theUserId );

   int sessionKeyInt = Math.abs( session.getId().hashCode() );
   sysLogger.info(theUserId + " " + sessionKeyInt +" -------------------------- Page: " + pageTitle );

   if ( dbData == null )
   {
      out.print( "<p><font color=red>Error: dbData is null... most likely the datasource is not configured</font><p>&nbsp;" );
   }

   Person userPerson = new Person( dbData, -1 ); //initialize
   jwm.idmanager.Users currUser =null;

   if ( request.getUserPrincipal() != null )
   {
      int origLogLevel = dbData.getLog().getLogLevel(); // don't need to clutter log with this call
      dbData.getLog().setLogLevel(0);

      currUser = new jwm.idmanager.Users( dbData, request.getUserPrincipal() );  // get the person obj representing logged on user
      currUser.deepPopulate();
      userPerson = (Person) currUser.getOwner();

      dbData.getLog().setLogLevel(origLogLevel); // put it back to orig debug level
   }

   dbData.getLog().logEvent( "======================== Page: " + pageTitle + " ==================== (" + userPerson.getFirstName() + " " + userPerson.getLastName() + ") ==============" );


   jspUtils.showFormData( request, dbData.getLog() );

   String webmasterName;
   String webmasterEmailAddress;

   { // scope this to prevent dup variables in including pages
      String contextPath = session.getServletContext().getResource("/").getPath();
      String parts[] = contextPath.split("/");
      String host = parts[1];
      webmasterName = SiteProperty.valueOf( dbData, "webMasterName", "webMaster" );
      webmasterEmailAddress = SiteProperty.valueOf( dbData, "webMasterEmailAddress", "Webmaster@"+host );
   }

   dbData.getLog().logEvent( "Last Form Instance Id: " + lastFormInstanceId + " -- Submitted Form Instance Id: " + submittedFormInstanceId );
%>

<% Vector callStack = (Vector) session.getAttribute( "callStack" );
// out.print( "<font size=-2>" );
// if ( callStack == null )
// {
//    callStack = new Vector();
//    session.setAttribute( "callStack", callStack );
// }
// for (int i = 0; i <  callStack.size(); i++ )
// {
//    CallBack cb = (CallBack) callStack.elementAt( i );
//    if ( cb.getJspName().equals( self.getJspName() ) )
//    {
//       for ( int j=i; j < callStack.size(); j++ )
//       {
//          callStack.remove(j); // we've hit ourselves in the stack, clear stack past this point
//       }
//       break;
//    }
//    out.print( "<a href="+cb.getJspName()+"?"+cb.getHRefParms()+">"+cb.getJspName()+"</a>--> " );
// }
// out.print("</font>");
// callStack.add( self );
%>
