<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <title><x:out select="$doc/WGBE/region/@name"/> Wedding Guide</title>
      <meta name="description" content="<x:out select="$doc/WGBE/region/pagedata/pagedescription"/>" >
      <meta name="keywords"    content="<x:out select="$doc/WGBE/region/pagedata/keywords"/> <x:out select="$doc/WGBE/region/categories/category[@selected=true]/keywords"/>" >

      <link href="/css/<x:out select="$doc/WGBE/region/pagedata/@cssname"/>-main.css" rel="stylesheet" type="text/css" />
      <%@ include file="javascript_incl.jsp" %>

      <x:set var="htmltmp" select="string($doc/WGBE/region/pagedata/googleverify)"/>
      <c:out value="${htmltmp}" escapeXml="false"/>

      <x:set var="htmltmp" select="string($doc/WGBE/region/pagedata/bingverify)"/>
      <c:out value="${htmltmp}" escapeXml="false"/>

   </head>
   <body onLoad="randomizeBanners();">

      <!--[if lte IE 8]> <div style=' clear: both; height: 59px; width:100%; text-align:center; padding:0 auto; margin: 0 auto; position: absolute; top:0;'> <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx"><img src="http://www.ie6countdown.com/images/upgrade.jpg" border="0" height="42" width="820" alt="" /></a></div> <![endif]-->
