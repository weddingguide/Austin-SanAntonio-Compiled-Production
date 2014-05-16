<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta name="description" content="<x:out select="$doc/WGBE/region/pagedata/pagedescription"/>">
      <meta name="keywords"    content="<x:out select="$doc/WGBE/region/pagedata/keywords"/> <x:out select="$doc/WGBE/region/categories/category[@selected=true]/keywords"/>">
      <title>
      <x:if select="$doc/WGBE/region/categories/category/profiles[@count=1]/profile">
        <x:out select="$doc/WGBE/region/categories/category/profiles/profile/@vendorName" /> -
      </x:if>
      <x:if select="$doc/WGBE/region/categories/category">
         <x:out select="$doc/WGBE/region/@name"/> Wedding <x:out select="$doc/WGBE/region/categories/category/categorynames/categoryname/@name"/> :
      </x:if>
      <x:out select="$doc/WGBE/region/@name"/> Wedding Guide
      </title>
      <link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css" media="screen,print" />
      <link type="text/css" rel="stylesheet" href="/css/layout.css" media="screen,print" />
      <link rel="stylesheet" type="text/css" href="/css/style.css">
      <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
      <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
      <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700' rel='stylesheet' type='text/css'>

      <%@ include file="javascript_incl.jsp" %>
      <%@ include file="Banner_javascript_incl.jsp" %>

      <x:set var="htmltmp" select="string($doc/WGBE/region/pagedata/googleverify)"/>
      <c:out value="${htmltmp}" escapeXml="false"/>

      <x:set var="htmltmp" select="string($doc/WGBE/region/pagedata/bingverify)"/>
      <c:out value="${htmltmp}" escapeXml="false"/>
   </head>
   
   <body onLoad="randomizeBanners();">
      <%@ include file="googleRemarketing_incl.jsp" %>
   <div class="banners">
      <%@ include file="AdHeader_incl.jsp" %>
   </div>
      <!--[if lte IE 8]> <div style=' clear: both; height: 59px; width:100%; text-align:center; padding:0 auto; margin: 0 auto; position: absolute; top:0;'> <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx"><img src="http://www.ie6countdown.com/images/upgrade.jpg" border="0" height="42" width="820" alt="" /></a></div> <![endif]-->