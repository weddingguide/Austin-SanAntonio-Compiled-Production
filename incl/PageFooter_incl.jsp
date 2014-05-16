   <%@ include file="googleAnalytics1_incl.jsp" %>
   <%@ include file="googleRemarketing_incl.jsp" %>
   <%@ include file="footerJs_incl.jsp" %>
<%    if (showXML.equals( "true" ) )
      {
%>
         &nbsp;
         <textarea style="font-size:10px; width:100%" rows=20><%= dataAccess.toXML()%></textarea>
<%
      }
      if (showXML.equals( "link" ) )
      {
%>
         <p>&nbsp;
         <hr>
         <a target="_modelXML" href="/WGBEData.xml?cached">View XML Model</a>
<%
      }
      if (showLog.equals( "true" ) )
      {
%>
         &nbsp;
         <textarea style="font-size:10px; width:100%" rows=20><%= ((BufferLog) dbData.getLog()).getLogData()%></textarea>
<%
      }
%>

   </body>
</html>
