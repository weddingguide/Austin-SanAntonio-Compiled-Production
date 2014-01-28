<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="imports_incl.jsp" %>

    <%@ include file="SiteVariables_incl.jsp" %>
    <%@ include file="PageGlobalVariables_incl.jsp" %>
    <%@ include file="syslogger_incl.jsp" %>
<%
    try
    {
%>
       <%@ include file="dbData_incl.jsp" %>
       <% dbData.getLog().setLogLevel( Log.ERROR ); %>
       <%@ include file="init_incl.jsp" %>
       <%@ include file="CurrUserInfo_incl.jsp" %>
       <%@ include file="config_incl.jsp" %>
       <%@ include file="FormInstanceId_incl.jsp" %>
       <%@ include file="PageLogging_incl.jsp" %>
