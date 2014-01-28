<div class="profile-header">

   <h3><%=EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 1, 0)%></h3>
   <% String[] addresses = EntityAttributeList.getAttributeValues(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 2, 0);
      String[] phoneNumbers = EntityAttributeList.getAttributeValues(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 3, 0);
      String[] webSites = EntityAttributeList.getAttributeValues(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 5, 0);
      String[] maps = EntityAttributeList.getAttributeValues(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 45, 0);
      String[] embedMaps = EntityAttributeList.getAttributeValues(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 45, 0);

      int addressCount; // can have blank attributes... need to investigate... but for now, just do the hack
      for (addressCount=0; addressCount < addresses.length; addressCount++ )
      {
         if ( addresses[addressCount].trim().equals("") ) break; // stop on first blank addr attribute
      }

      String allCategories = "a";
      for (int i=0; i<vendorCategories.getRecordList().length; i++ )
      {
         EntityGroup vendorCategory = (EntityGroup) vendorCategories.getRecordList()[i]; // list defined in setup_incl.jsp
         allCategories += "&"+vendorCategory.getName();
      }

      if ( addressCount > 0 )
      {
         for (int i = 0; i < addressCount; i++ )
         {
      %>
             <p><%=addresses[i]%>
                <br/>
                <%
                if( phoneNumbers.length > i )
                {
                   for ( int j=0; j<phoneNumbers.length; j++ )
                   {
                      if ( j > 0 ) out.print( "<br/>" );
                      out.print( phoneNumbers[j]);
                   }
                }
     %>
                <br/>

                <% if (addressCount > 1 )  // if multiple addresses, put websites in this block, else put single website below.
                   {
                %>
                     <%@ include file="websitelink_incl.jsp" %>
                     <%@ include file="maplink_incl.jsp" %>
                <% } %>
             </p>
     <%  }
      }
      else // no addresses, but got to try to display phone numbers 5/19/10
      {
         if( phoneNumbers.length > 0 )
         {
  %>
            <p>
  <%
            for ( int i=0; i<phoneNumbers.length; i++ )
            {
               if ( i > 0 ) out.print( "<br/>" );
               out.print( phoneNumbers[i]);
            }
  %>
            </p>
  <%
         }
      }
  %>
</div>

<% { // contain all code in one block to avoid variable scoping concerns %>

   <div class="profile-nav">
      <ul>
         <% String email = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 4, 0);
            if ( !email.equals("") )
            {
         %>
               <li><a href="javascript:popUp('/contact.jsp?popup&businessEntityId=<%=businessEntityId%>&<%=allCategories%>')" class="email">Email</a></li>
         <% } %>


  <% if (addressCount <= 1 )
     {
         int i = 0; // use the first ndx for the website and map
     %>
         <%@ include file="websitelink_incl.jsp" %>
         <%@ include file="maplink_incl.jsp" %>
  <% } %>


         <% //Specials Block
          String special = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 48, 0, true);
            if ( !special.equals("") )
            {
         %>
               <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantVendorName(businessEntityId)%>/specials" class="special">Specials</a></li>
         <% }  //end Specials Block %>


         <% //Event Block AD rev. 11/2/2011
            String event = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 49, 0, true);
            if ( !event.equals("") )
            {
         %>
               <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantVendorName(businessEntityId)%>/events" class="event">Events</a></li>
         <% }  //end event block %>

         <%
             // first need to see how many, if any, vendor categories support details view
               Vector detailsCategories = new Vector();
               for ( int i = 0; i < vendorCategories.getRecordList().length; i++ )
               {
                  EntityGroup vendorCategory = (EntityGroup) vendorCategories.getRecordList()[i];
                  if ( vendorCategory.getAliasOf() == -1 ) // don't include alias category names (e.g. 'facilities'
                  {
                     if (EntityGroup.isMemberOfGroup( dbData, 4422, EntityGroup.TYPE_GROUP, vendorCategory.getGroupNum() )) // is this vendor category in the "Supports details" group?
                     {
                        detailsCategories.add( vendorCategory );
                     }
                  }
               }

               //out.print( "detailsCategories size = " + detailsCategories.size() );

               if ( detailsCategories.size() == 1 ) // vendorCategories list created in setup_incl.jsp
               {
                 EntityGroup vCategory = (EntityGroup) detailsCategories.elementAt( 0 );
                 // get attributeDef for "omit details" checkbox for this category
                 EntityAttributeDef omitDetails = new EntityAttributeDef( dbData, vCategory.getGroupNum(), "OmitDetails" );

                 if ( !EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, omitDetails.getId(), 0 ).equals("checked"))
                 {
         %>
                  <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantCategoryName(vCategory.getGroupNum())%>/<%=wgbeUtils.getURLCompliantVendorNameNoCategory(businessEntityId)%>/details" class="details">Details</a></li>

         <%
                 }
               }
               else if ( detailsCategories.size() > 1 ) // multiple vendor categories
               {
         %>
                  <li><a href="#" class="details">Details<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr><td><![endif]-->
                  <ul>
         <%
                     for ( int i = 0; i < detailsCategories.size(); i++ )
                     {
                        EntityGroup vendorCategory = (EntityGroup) detailsCategories.elementAt(i);
                        // get attributeDef for "omit details" checkbox for this category
                        EntityAttributeDef omitDetails = new EntityAttributeDef( dbData, vendorCategory.getGroupNum(), "OmitDetails" );

                        if ( !EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, omitDetails.getId(), 0 ).equals("checked"))
                        {
         %>
                           <li><img src="/images/icons/<%=vendorCategory.getName()%>.png" width="16" height="16" border="0" /><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantCategoryName(vendorCategory.getGroupNum())%>/<%=wgbeUtils.getURLCompliantVendorNameNoCategory(businessEntityId)%>/details"><%=vendorCategory.getName()%></a></li>
         <%             } %>
         <%          } %>
                  </ul><!--[if lte IE 6]></td></tr></\table></a><![endif]-->
            <% } %>

<% //Testimonials button
   //Created by Anton Domratchev %>
 <% String testimonials = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 124, 0);
            if ( !testimonials.equals("") )
            {
         %>
               <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantVendorName(businessEntityId)%>/testimonials" class="testimonial">Testimonials</a></li>
         <% } %>
<% //END Testimonials button %>


         <% String[] virtuals = EntityAttributeList.getAttributeValues(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 9, 0);
            int vtndx = 0;
            for ( int v=0; v<virtuals.length; v++ )
            {
               String suffix = "";
               if (virtuals.length > 1 ) suffix = " (" + (vtndx+1) + ")";
               if ( !virtuals[v].equals( "" ))
               {
                  String virtual = URLEncoder.encode( virtuals[v], "UTF-8");
                  String embedVirtual = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 9, 1, v);
                  if ( embedVirtual.equals("checked"))
                  {
            %>
                  <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantVendorName(businessEntityId)%>/virtual?tour=<%=virtual%>" class="virtual">Virtual Tour</a></li>
               <% } else { %>
                  <li><a href="http://<%=virtual%>" target=_virtual class="virtual">Virtual Tour</a></li>
               <% } %>
               <% vtndx++; %>
            <% } %>
         <% } %>


         <% String video = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 10, 0);
            boolean embedVideo = !EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 10, 1).equals( "External URL" );
            String videoThumbnail = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 10, 2);
            if ( !video.equals("") )
            {
               if (embedVideo)
               {
         %>
                  <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantVendorName(businessEntityId)%>/video" class="video">Video</a></li>

            <% } else { %>
               <li><a target="_video" href="http://<%=video%>" class="video">Video</a></li>
            <% } %>
         <% } %>

         <% String audio = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 47, 0);
            boolean embedAudio = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 47, 1).equals( "checked" );

            if (( !audio.equals("")) && (embedAudio))
            {
         %>
                  <li><a href="<%=urlPrefix%>/<%=wgbeUtils.getURLCompliantVendorName(businessEntityId)%>/audio" class="audio">Audio</a></li>
<%          } %>


         <% String facebook = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 12, 0);
            if ( !facebook.equals("") )
            {
         %>
               <li><a target="_facebook" href="http://<%=facebook%>" class="facebook">Facebook</a></li>
         <% } %>


         <% String myspace = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 13, 0);
            if ( !myspace.equals("") )
            {
         %>
               <li><a target="_myspace" href="http://<%=myspace%>" class="myspace">MySpace</a></li>
         <% } %>


         <% String twitter = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 11, 0);
            if ( !twitter.equals("") )
            {
         %>
               <li><a target="_twitter" href="http://<%=twitter%>" class="twitter">Twitter</a></li>
         <% } %>

         <% String pinterest = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 134, 0);
            if ( !pinterest.equals("") )
            {
         %>
               <li><a target="_pinterest" href="http://<%=pinterest%>" class="pinterest">Pinterest</a></li>
         <% } %>

         <% String googleplus = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 159, 0);
            if ( !googleplus.equals("") )
            {
         %>
               <li><a target="_googleplus" href="http://<%=googleplus%>" class="googleplus">Google+</a></li>
         <% } %>
         <% String instagram = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 160, 0);
            if ( !instagram.equals("") )
            {
         %>
               <li><a target="_instagram" href="http://<%=instagram%>" class="instagram">Instagram</a></li>
         <% } %>
         <% String blog = EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 161, 0);
            if ( !blog.equals("") )
            {
         %>
               <li><a target="_blog" href="http://<%=blog%>" class="blog">Blog</a></li>
         <% } %>
      </ul>
      <br class="clear" />
   </div>
<% } %>

<div class="share">

<% //Facebook Like button
   //Created by Anton Domratchev %>
   <script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="" send="false" width="225" show_faces="false" font=""></fb:like>
   <div id="fb-root"></div>
<% //END Facebook Like Button %>

</div>

<div class="profile-body">
   <%=EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 6, 0) %>
</div>

