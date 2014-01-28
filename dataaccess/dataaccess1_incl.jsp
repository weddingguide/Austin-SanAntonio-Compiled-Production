<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
   JLogger sysLogger = new JLogger();
   ServletDBData dbData = ServletDBData.getInstance( request, "jdbc/wgbe", true ); // dbData with buffer logging

   String logLevel = JSPUtils.getPersistentParameter( request, response, "logLevel", "DEBUG" );

   dbData.getLog().setLogLevel(logLevel);

   String showXML = JSPUtils.getPersistentParameter( request, response, "showXML", "false" );
   String showLog = JSPUtils.getPersistentParameter( request, response, "showLog", "false" );

   WGBEXMLDataAccess dataAccess = null;

   Document doc = null;

   try
   {
      sysLogger.fine( " Start Page: " + request.getMethod() + " " + request.getRequestURL() + " " + request.getQueryString() );

      dbData.setVersionHandler( new WGBEDataVersionHandler( request ) );

      JSPUtils jspUtils = new JSPUtils(request);

      // define the ctrl object that will be used to populate the model objects and to control what tags are exported
      WGBEDataAccessCtrl wgbeDataAccessCtrl = new WGBEDataAccessCtrl(); // note -- this constructor builds all additional ctrl objects

      wgbeDataAccessCtrl.setRegion( region );

      wgbeDataAccessCtrl.inclRegion           = true;  // all tags descend from region tag
      wgbeDataAccessCtrl.inclPageData         = true;  // page data is needed if we are building html pages from the data
      wgbeDataAccessCtrl.inclBanners          = true;  // banners are always included
      wgbeDataAccessCtrl.inclCategorySummary  = true;  // used for vendor category selection on all pages


      if ( request.getParameter( "popup" ) != null ) wgbeDataAccessCtrl.popupPageFlag = true; // have to do a few things different if page is a popup

      wgbeDataAccessCtrl.contactFormData = (ContactFormData)session.getAttribute("contactFormData");
      if (wgbeDataAccessCtrl.contactFormData == null)
      {
         wgbeDataAccessCtrl.contactFormData = new ContactFormData();
      }
      jspUtils.showFormData( request, dbData.getLog() );

%>
