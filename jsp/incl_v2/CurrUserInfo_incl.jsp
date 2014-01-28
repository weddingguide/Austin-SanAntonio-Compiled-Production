<%
   if ( request.getUserPrincipal() != null )
   {
      dbData.setCurrUserName( request.getUserPrincipal().getName());

      int origLogLevel = dbData.getLog().getLogLevel(); // don't need to clutter log with this call
//    dbData.getLog().setLogLevel(0);
      {
         dbData.getLog().logEvent( "#### user is logged on" );
         currUser = new jwm.idmanager.Users( dbData, request.getUserPrincipal() );  // get the person obj representing logged on user
         currUser.deepPopulate();

         if ( currUser.getOwnerType() == ObjectClassID.PERSON )
         {
            userPerson = (Person) currUser.getOwner();
         }
         else if ( currUser.getOwnerType() == ObjectClassID.CONTACT )
         {
            userContact = (Contact) currUser.getContactOwner();
            userPerson = new Person( dbData, currUser.getUserName() ); // this assumes that we're using the email address as the user id
         }
         else // default... probably not setting ownertype on all sites... just fall back to person
         {
            userPerson = (Person) currUser.getOwner();
         }

         java.sql.Timestamp now = new java.sql.Timestamp(   (new Date()).getTime()-1800000 );
         if ( currUser.getCurrLogin().before( now )) // been nore than 30min  since last access...
         {
            currUser.setLastLogin( currUser.getCurrLogin() );  // make the last 'currLogin' be the 'lastLogin' value
         }
         currUser.setCurrLogin( new java.sql.Timestamp((new Date()).getTime() )); // either way update currLogin
         currUser.updateRecord( "USERS", false, "" );
      }




      dbData.getLog().setLogLevel(origLogLevel); // put it back to orig debug level
     dbData.getLog().logEvent( request.getUserPrincipal().toString() );
   }
   else
   {
      currUser = new jwm.idmanager.Users( dbData, -1);
      dbData.getLog().logEvent( "Not Logged On" );
   }
%>
