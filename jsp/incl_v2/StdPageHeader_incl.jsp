<%@page contentType="text/html;charset=UTF-8"%>


<%@ include file="taglibs_incl.jsp" %>
<%@ include file="imports_incl.jsp" %>

    <%@ include file="SiteVariables_incl.jsp" %>
    <%@ include file="PageGlobalVariables_incl.jsp" %>
    <%@ include file="syslogger_incl.jsp" %>
<%
    if (printable) bodyClass = "bodyprint";

    try
    {
%>
       <%@ include file="mobiledetect.jsp" %>
       <%@ include file="dbData_incl.jsp" %>
       <%@ include file="init_incl.jsp" %>
       <%@ include file="CurrUserInfo_incl.jsp" %>
       <%@ include file="config_incl.jsp" %>
       <%@ include file="FormInstanceId_incl.jsp" %>
       <%@ include file="PageLogging_incl.jsp" %>
       <%@ include file="PageTitle_incl.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
       <head>
          <%@ include file="HTMLHeader_incl.jsp" %>
          <%@ include file="../datetimeincl/dateincl.js" %>
          <%@ include file="expandcollapse_js.jsp" %>
       </head>

       <body class="<%=bodyClass%>">

