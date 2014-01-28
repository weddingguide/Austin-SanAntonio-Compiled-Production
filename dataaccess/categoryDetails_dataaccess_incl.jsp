<%
   wgbeDataAccessCtrl.inclCategories  = true;

   wgbeDataAccessCtrl.getCategoryCtrl().singleCategory = jspUtils.getIntParm( "category" );
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().singleCategoryId = jspUtils.getIntParm( "category" ); // needs to be passed to profilelist as well
   wgbeDataAccessCtrl.getCategoryCtrl().getSpotlightProfileCtrl().singleCategoryId = jspUtils.getIntParm( "category" ); // needs to be passed to profilelist as well

   wgbeDataAccessCtrl.getCategoryCtrl().inclDescription = true;
   wgbeDataAccessCtrl.getCategoryCtrl().inclProfiles = true;
   wgbeDataAccessCtrl.getCategoryCtrl().inclDetails      =true;
   wgbeDataAccessCtrl.getCategorySummaryCtrl().inclProfiles = false;

   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().useProfileSets   = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclContactInfo  = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclAddress      = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclDescription  = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclAvatar       = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclAbstract     = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().truncateAbstract = 85;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclDetails      = true;
   wgbeDataAccessCtrl.getCategoryCtrl().getProfileCtrl().inclVirtualTours = true;

%>

