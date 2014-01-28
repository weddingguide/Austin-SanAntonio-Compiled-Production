<%
   if ( request.isUserInRole( "WGBEAdmin" ))
   {
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      pstmt = dbData.getConnection().prepareStatement("SELECT date, contactFormData FROM contactformemailqueue where status = 0" );
      rs = pstmt.executeQuery();
      int queueCount = 0;
      while(rs.next() )
      {
         queueCount++;
      }
%>
     <h4>Contact Form Queue Count = <%=queueCount%></h4>
<%
   }
%>
