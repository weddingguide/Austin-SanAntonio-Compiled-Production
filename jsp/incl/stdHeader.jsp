<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="jwm.db.*" %>
<%@ page import="jwm.servletdb.*" %>
<%@ page import="jwm.jsputils.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="org.apache.juli.*" %>
<%@ page import="jwm.idmanager.*" %>
<%@ page import="jwm.entity.*" %>
<%@ page import="jwm.mailer.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%  DBData dbData = null;
    Logger sysLogger = Logger.getLogger( "initial-temp" );
    try
    {
%>

<% int dateBeginYear = 2004; // used by date/time control;  need to define and init variables here %>
<% int dateEndYear = 2020; // used by date/time control;  need to define and init variables here %>


  <c:import url="/siteText.jsp" context="/webAppSiteSpecific" />

<% pageTitle = pageTitle.replaceAll( "%1", pageTitleVar ); %>

<% int historyLimit = 5; //default to last 5 history items %>

<% String formInstanceId = new Integer(((new Date() ).toString() + pageTitle).hashCode()).toString(); %>

<% JSPUtils jspUtils = new JSPUtils( request ); %>

<% CallBack self = new CallBack( request, formInstanceId ); %>

<%
   String lastFormInstanceId = (String) session.getValue( "lastFormInstanceId" );
   if ( lastFormInstanceId == null ) lastFormInstanceId = "";

   String submittedFormInstanceId = jspUtils.getParameter( "formInstanceId" );
   if ( submittedFormInstanceId == null ) submittedFormInstanceId = "";


   boolean newFormSubmit = !submittedFormInstanceId.equals(lastFormInstanceId);
%>

<% // variables that control the group_incl code
   int groupUpdateType = GroupCategory.UPDATETYPE_DEFAULT;
   int groupAssociatedWithType = -1;
   int groupAssociatedWithId = -1;
   boolean showAvailGroups = true;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
   <head>

      <title><%=pageTitle%></title>
      <link rel="image_src" href="<%=request.getParameter("image")%>" >
      <meta name="description" content="<%=request.getParameter("pagedescription")%>">

      <!-- for Facebook links -->
      <meta property="og:title" content="<%=pageTitle%>" />
      <meta property="og:description" content="<%=request.getParameter("pagedescription")%>" />
      <meta property="og:image" content="http://2gvp.com/<%=request.getParameter("image")%>" />


      <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
      <meta http-equiv="Content-Language" content="en-US" /><meta http-equiv="imagetoolbar" content="no" /><meta name="MSSmartTagsPreventParsing" content="true" /><meta name="description" content="description" /><meta name="keywords" content="keywords" /><meta name="author" content="Jerry Malcom" /><link rel="shortcut icon" type="image/ico" href="/favicon.ico" />

      <c:import url="/siteStyle.jsp" context="/webAppSiteSpecific" />
      <link href="/css/tabber.css" rel="stylesheet" type="text/css">

      <script src="/js/motionpack.js"></script>
      <script type="text/javascript">
        var GB_ROOT_DIR = "/greybox/";
      </script>
      <link rel="stylesheet" type="text/css" media="print" href="/css/print.css" />
      <script type="text/javascript" src="/greybox/AJS.js"></script>
      <script type="text/javascript" src="/greybox/AJS_fx.js"></script>
      <script type="text/javascript" src="/greybox/gb_scripts.js"></script>
      <link href="/greybox/gb_styles.css" rel="stylesheet" type="text/css" />

      <% String contextURL = session.getServletContext().getContextPath(); %>

      <script src="/webapps/<%=contextURL%>/jsp/javascript/sorttable.js"></script>
      <script type="text/javascript" src="/webapps/<%=contextURL%>/jsp/javascript/tabber.js"></script>

   </head>
   <body>

       <%@ include file="../datetimeincl/dateincl.js" %>
       <div id="page-container">

      <% boolean pageTitleDisplayed = false; // need to know if siteHeader displays the H1 page title %>
      <% request.setAttribute( "pageTitleDisplayed", "false" ); %>

      <% if ( jspUtils.getParameter( "noheader" ) == null ) {  %>
         <% request.setAttribute( "pageTitle", pageTitle ); %>
         <c:import url="/siteHeader.jsp" context="/webAppSiteSpecific" />

         <% if ( ( (String) request.getAttribute( "pageTitleDisplayed")).equals("true")) pageTitleDisplayed=true; %>
         <% if (!pageTitleDisplayed) { %>
            <h1><%=pageTitle%></h1>
         <% } %>
      <% } %>

      <% boolean incl_std_person_group_block = true; %>

      <% boolean showEmailSubscribe = true; %>

