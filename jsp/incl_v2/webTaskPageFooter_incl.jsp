<%
   }
   catch( Exception e)
   {

      System.out.println( "WebTaskPageFooter -- Login failed");
      e.printStackTrace( System.out );
      dbData.getLog().logEvent( "Login failed\n" + e);
      out.print( "<h1>Login Failed</h1>");
   }
%>
<%@ include file="AjaxPageFooter_incl.jsp" %>
