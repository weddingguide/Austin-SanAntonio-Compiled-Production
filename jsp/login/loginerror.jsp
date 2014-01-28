<% String pageTitle="Login Error"; %>
<%@ include file="../incl/AppHeader.jsp" %>

      <%  String contextPath = session.getServletContext().getResource("/").getPath();
          String parts[] = contextPath.split("/");   %>


              <h2 class="login">Login</h2>
              <h3 class="login">Please enter your username and password to login.</h3>

              <form name=form1 method="post" action="/<%=parts[parts.length-1]%>/j_security_check">
                 <fieldset>
                   <legend>Login</legend>

                   <label for="username">Username: </label>
                   <input type="text" id="username" name="j_username" tabindex="1" value="" title="username"><br />
                   <label for="password">Password: </label>
                   <input type="password" id="password" name="j_password" tabindex="2" title="password"><br />
                   <label for="submit"></label>
                   <input type="submit" value="Login" id="login" tabindex="3"><br />
                   <small><a href="href=/idmanager/jsp/guest/createaccount.jsp">Create User ID</a></small>
                   <small><a href="href=/idmanager/jsp/guest/forgotpassword.jsp">Forgot password?</a></small>
                 </fieldset>
              </form>

              <p class="errorMessage">The id/password combination that you entered does not exist.</p>

   </body>
</html>

<script language="JavaScript">
   document.form1.j_username.focus();
</script>

<%@ include file="../incl/AppFooter.jsp" %>
