<table>
  <tr class="menu">
      <%
       if ( request.getUserPrincipal() != null )
       {
           if ( request.getParameter( "iframe") == null )
           {
               if (    ( !pageTitle.equals( "Login" ))
                    && ( !pageTitle.equals( "Login Error" ))
                    && ( !pageTitle.equals( "Create A User ID For Your Account" ))
                    && ( !pageTitle.equals( "Payment Receipt" ))
                    && ( pageTitle.indexOf( "Home Page") == -1 )
                  )
               {
         %>
                 <td class="menu"><a class="menuanchor" href=/idmanager/jsp/user/home.jsp>My Account Home</a></td>
            <% }

               if (    ( !pageTitle.equals( "Login" ))
                    && ( !pageTitle.equals( "Create A User ID For Your Account" ))
                    && ( !pageTitle.equals( "Payment Receipt" ))
                    && ( !pageTitle.equals( "Login Error" )))
               {
            %>
                 <td class="menu"><a class="menuanchor" href=/idmanager/jsp/guest/logoff.jsp>Logoff</a></td>
            <% } %>
       <% } %>
    <% } %>
