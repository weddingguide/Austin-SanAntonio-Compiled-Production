<div class="narrowContainer">
<%
     String contextPath = session.getServletContext().getResource("/").getPath();
     String parts[] = contextPath.split("/");
%>
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

          <small><a href="/idmanager2/jsp/guest/createaccount.jsp">Create User ID</a>
          | <a href="/idmanager2/jsp/guest/forgotpassword.jsp">Forgot password?</a></small>
       </fieldset>
    </form>
    <script language="JavaScript">
       document.form1.j_username.focus();
    </script>
</div>
