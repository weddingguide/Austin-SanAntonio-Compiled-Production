<%
   // note... 5/29/12 -- with WGBE lead/vendor migration, we now have the first situation where userids are associated with contact objects
   // and not with person objects.  The USERS record ownerType will identify type.  But this means we will now have the possibility of userPerson or userContact
   // object... one or the other, and not both.  Theoretially, I guess we could mix on one site.  But no reason to take that risk.  Code still needs
   // to handle either case. But just set a policy that site A is userPerson and site B will be userContact

   Person userPerson = new Person( dbData, -1 ); //initialize
   Contact userContact = new Contact( dbData, -1 );

   jwm.idmanager.Users currUser =null;



   { // scope this to prevent dup variables in including pages
      String contextPath = session.getServletContext().getResource("/").getPath();
      String parts[] = contextPath.split("/");
      String host = parts[1];
      webmasterName = SiteProperty.valueOf( dbData, "webMasterName", "webMaster" );
      webmasterEmailAddress = SiteProperty.valueOf( dbData, "webMasterEmailAddress", "Webmaster@"+host );
   }

   EntityCustomTextList customText = new EntityCustomTextList( dbData );


   String domainName = "";
   { // variable scoping
      String domainPrefix = "";
      String domainSuffix = ".com";
      if (request.getRequestURL().toString().toLowerCase().indexOf( "local." ) > -1 ) domainPrefix = "local.";
      if (request.getRequestURL().toString().toLowerCase().indexOf( ".net" ) > -1 ) domainSuffix = ".net";

      if ( useFullyQualifiedLinks )
      {
         domainName = "http://"
                     +domainPrefix
                     +EntityAttributeList.getAttributeValue(dbData, ObjectClassID.DOMAIN, domainId, 0, 14, 0 , true)
                     +domainSuffix;
      }
   }

%>
