<%
      wgbeDataAccessCtrl.inclFeaturedCategories  = true;
      wgbeDataAccessCtrl.inclFeaturedProfiles    = true;
      wgbeDataAccessCtrl.inclBlog                = true;
      wgbeDataAccessCtrl.inclSpecials            = true;
      wgbeDataAccessCtrl.inclEvents              = true;
      wgbeDataAccessCtrl.specialsCount           = 4;
      wgbeDataAccessCtrl.eventsCount             = 4;
      wgbeDataAccessCtrl.randomizeSpecials       = true;
      wgbeDataAccessCtrl.randomizeEvents         = true;
      wgbeDataAccessCtrl.blogPostCount           = 3;

      wgbeDataAccessCtrl.inclStaticContent       = true;
      String[] staticContentNames                = { "Home Page Main",
                                                     "Promo Block 1",
                                                     "Promo Block 2",
                                                     "Promo Block 3",
                                                     "BrideTalk",
                                                     "WGBETV"
                                                   };
      wgbeDataAccessCtrl.staticContentNames      = staticContentNames;

      // featured profile sidebar
      wgbeDataAccessCtrl.getFeaturedVendorProfileCtrl().inclContactInfo  = true;
      wgbeDataAccessCtrl.getFeaturedVendorProfileCtrl().inclAvatar       = true;
      wgbeDataAccessCtrl.getFeaturedVendorProfileCtrl().inclAbstract     = true;
      wgbeDataAccessCtrl.getFeaturedVendorProfileCtrl().inclNdxId        = true;
      wgbeDataAccessCtrl.getFeaturedVendorProfileCtrl().truncateAbstract = 85;
      wgbeDataAccessCtrl.getFeaturedVendorProfileCtrl().profileSetSize   = 7;

%>
