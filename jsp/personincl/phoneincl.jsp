         <label for="phoneNumber<%=phoneLabel%>">
            Phone
            <% if ((!search)&&(!phoneType.equals("")) ) { %>
               (<%=phoneType%>)
            <% } %>
                <% if ( !readOnly ) { %>
                           <input type=hidden name="groupId<%=phoneLabel%>" value=1>
                           <input type=hidden name="phoneNumberType<%=phoneLabel%>" value=<%=phone.getPhoneNumberType()%>>
                           <input type=hidden name="phoneId<%=phoneLabel%>" value=<%=phone.getPhoneId()%>>
                <% } %>
         </label>

    <% if ( !readOnly ) { %>
            <input name="phoneNumber<%=phoneLabel%>" id="phoneNumber<%=phoneLabel%>" type="text" size="20" value="<%= phone.getPhoneNumber() %>"><br />
    <% } else { %>
             <% if ( phone.getPhoneNumber().equals("")) { %>
                ---
             <% } else { %>
               <%= phone.getPhoneNumber() %>
             <% } %>
    <% } %>
