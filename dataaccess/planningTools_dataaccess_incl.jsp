<%

      wgbeDataAccessCtrl.inclArticles                       = true;

      wgbeDataAccessCtrl.getArticleCtrl().group             = region;


      String[] articleSets                           = {"First Steps",
                                                        "Celebration",
                                                        "Finery",
                                                        "Images",
                                                        "Entertainment",
                                                        "Beauty"
                                                       };
      wgbeDataAccessCtrl.getArticleCtrl().articleSets  = articleSets;




      wgbeDataAccessCtrl.inclStaticContent       = true;
      String[] staticContentNames                = { "Planning Tools",
                                                     "WG Distribution",
                                                     "Idea/Photo Gallery",
                                                     "Articles",
                                                     "Checklists",
                                                     "Budget Calculator",
                                                     "Wedding Gown Search",
                                                     "Bride Registration",
                                                     "About",
                                                     "ContactUsContents",
                                                     "PassportToMarriage"
                                                   };
      wgbeDataAccessCtrl.staticContentNames      = staticContentNames;

%>
