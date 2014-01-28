    <table border=1>
       <tr>
          <td>Address:</td>
          <td><%=entity.getAddress().getAddressLine1()%>
          <%if (!entity.getAddress().getAddressLine2().equals("")) { %>
                 <br><%=entity.getAddress().getAddressLine2()%>
          <% } %>
                <br><%=entity.getAddress().getCity() + ", " + entity.getAddress().getState() + " " + entity.getAddress().getPostalCode()%>
          </td>
       </tr>
       <tr>
          <td>Phone:</td>
          <td><%=entity.getPhone().getPhoneNumber()%></td>
       </tr>
       <tr>
          <td>Email:</td>
          <td><%=entity.getEmail().getEmailAddress()%></td>
       </tr>
       <tr>
          <td>Web Address:</td>
          <td><%=entity.getUrl()%></td>
       </tr>
    </table>
