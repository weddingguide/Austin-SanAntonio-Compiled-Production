<%    System.out.println( "Footer... checking for 'noLog' = " + request.getParameter( "noLog" ));
      if ( request.getParameter( "noLog" ) == null )
      {
         System.out.println( "Footer... including xml and logs");
         if (showXML.equals( "true" ) )
         {
            if ( dataAccess != null )
            {
%>
               &nbsp;
               <textarea style="font-size:10px; width:100%" rows=20><%= dataAccess.toXML()%></textarea>
<%
            }
         }

         if (showXML.equals( "link" ) )
         {
%>
            <p>&nbsp;
            <hr>
            <a target="_modelXML" href="../../jwmbos.xml?cached">View XML Model</a>
<%
         }
      }
%>
      <%@ include file="PageEndCatchFinally_incl.jsp" %>
   </body>
</html>
