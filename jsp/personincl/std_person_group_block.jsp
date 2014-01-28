          <% if (( !search )
               && ( !forceReadWrite )
               && ( request.getParameter( "block1") == null ) )
           {
          %>
             <% int groupType = 0; %>
        <% if (( request.isUserInRole( "CISOperator" ) ) || ( request.isUserInRole( "CISOperator" ) ) ) { %>
                <p>&nbsp;
                <% if ( !readOnly ) { %>
                  <input name="cisaction" type="submit" value="Submit">
                <% } else { %>
                  <input name="action" type="submit" value="Return">
                <% } %>
            </div>
            <hr>
            <div class="tabbertab" title="Groups">
                <h3>&nbsp;</h3>

                  <%@ include file="group_incl.jsp" %>

                  <% if (( groupsDisplayed) && (request.isUserInRole( "CISAdministrator" ))) { %>
                      <center>
                         <a href=/cis/jsp/administrator/ShowEntityGroupList.jsp>Manage Groups</a>
                      </center>
                  <% } %>

          <% } %>

        <% } %>
