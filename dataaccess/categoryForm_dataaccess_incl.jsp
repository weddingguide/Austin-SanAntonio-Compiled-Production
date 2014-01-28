<%
   wgbeDataAccessCtrl.inclCategories  = true;

   wgbeDataAccessCtrl.getCategoryCtrl().singleCategory = jspUtils.getIntParm( "category" );
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().singleCategoryId = jspUtils.getIntParm( "category" ); // needs to be passed to profilelist as well
   wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().singleCategoryId = jspUtils.getIntParm( "category" ); // needs to be passed to profilelist as well


   wgbeDataAccessCtrl.currPageURL = request.getServletPath();
   if (jspUtils.getIntParm( "category" ) > 0 )
   {
      wgbeDataAccessCtrl.currPageURL = "/"+WGBEUtils.getURLCompliantCategoryName( dbData, jspUtils.getIntParm( "category" ));
   }
   wgbeDataAccessCtrl.baseURLQueryString = request.getQueryString();


   String search = request.getParameter( "search" );
   if ( search != null )
   {
      // we're going to use -2 for a category id that means 'search'
      wgbeDataAccessCtrl.getCategoryCtrl().singleCategory = -2;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().singleCategoryId = -2;

      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().doSearch = true;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().doSearch = true;

      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().searchString = search;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().searchString = search;
   }
   else // this is not a search
   {
      wgbeDataAccessCtrl.getCategoryCtrl().inclSpotlightProfiles = true;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().useProfileSets  = false;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().profileSetSize  = 5;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().randomize = true;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().profileSetMinimum  = 8; // if less that 8 total profiles, do not include any spotlights
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().profileSetId  = 0;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().inclAvatar       = true;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().inclCategories   = true;
      wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().inclContactInfo  = true;
   }


   wgbeDataAccessCtrl.getCategoryCtrl().inclDescription = true;
   wgbeDataAccessCtrl.getCategoryCtrl().inclProfiles = true;
   wgbeDataAccessCtrl.getCategoryCtrl().inclDetails      =true;
   wgbeDataAccessCtrl.getCategorySummaryCtrl().inclProfiles = false;

   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().useProfileSets  = true;


   if ( request.getParameter( "page" ) != null )
   {
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().profileSetSize  = 14;
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().profileSetId  = jspUtils.getIntParm( "page" );
   }
   else if ( request.getParameter( "all" ) != null )
   {
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().profileSetSize  = 99999;
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().profileSetId  = 1;
   }
   else // put everything on one page no matter how many.... and do random start (carousel mode)
   {
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().randomStart   = false;
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().profileSetSize  = 99999;
      wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().profileSetId  = 1;
   }

   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclContactInfo  = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclAddress = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclDescription = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclAvatar       = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclAbstract     = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().truncateAbstract  = 85;


%>

