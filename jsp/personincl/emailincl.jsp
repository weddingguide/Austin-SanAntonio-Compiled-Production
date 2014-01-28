        <label for="emailAddress<%=emailLabel%>">
            eMail
            <% if ((!search)&&(!emailType.equals("")) ) { %>
               (<%=emailType%>)
            <% } %>
        </label>
    <% if ( !readOnly ) { %>
               <input type=hidden name="emailAddressType<%=emailLabel%>" value=<%=email.getEmailAddressType()%>>
               <input type=hidden name="emailId<%=emailLabel%>" id="emailId<%=emailLabel%>" value=<%=email.getEmailId()%>>
    <% } %>
    <% if ( !readOnly ) { %>
               <input name="emailAddress<%=emailLabel%>" type="text" value='<%= email.getEmailAddress() %>'>
    <% } else { %>
               <% if ( email.getEmailAddress().equals("") ) { %>
                  ---
               <% } else { %>
               <%= email.getEmailAddress() %>
               <% } %>
    <% } %>

            <% if (!email.isRecordFound()) email.setSubscribe(1); %>
    <% if ( !readOnly ) { %>
                   <% if ( (!search ) && (showEmailSubscribe))
                    {
                   %>
                      <div style="display:inline">
                 <% } else { %>
                      <div style="display:none">
                 <% } %>

                        - <input name="subscribe<%=emailLabel%>" type=checkbox
                               <% if ( email.getSubscribe() != 0 )
                                  {
                                     out.print( " CHECKED " );
                                  }
                               %>
                           > Subscribed to receive email
                 </div>
    <% } else { %>
                               <% if ( email.getSubscribe() != 0 )
                                  {
                               %>
                                    -- Subscribed to receive email
                              <% } %>
    <% } %>
       <br />
