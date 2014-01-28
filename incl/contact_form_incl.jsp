  <fieldset>
    <legend>Contact Information</legend>
      <label>First Name</label>
        <input type="text" name="firstName" id="firstName" value="<%=contactFormData.firstName%>">
      <label>Last Name</label>
        <input type="text" name="lastName" id="lastName" value="<%=contactFormData.lastName%>">
      <label>I am </label>
        <select name="me" id="me">
          <option value="notSpecified">Please select one</option>
          <option value="bride" <% if (contactFormData.me.equals("bride")) out.print(" selected=\"SELECTED\"" );%>>the bride</option>
          <option value="groom" <% if (contactFormData.me.equals("groom")) out.print(" selected=\"SELECTED\"" );%>>the groom</option>
          <option value="other" <% if (contactFormData.me.equals("other")) out.print(" selected=\"SELECTED\"" );%>>other</option>
        </select>
        <div class="tool-tip"> Select your role in a wedding</div>
      <label>Email</label>
        <input name="email" type="text" id="email" value="<%=contactFormData.email%>">
          <label>Phone</label>
        <input type="text" name="phone" id="phone" value="<%=contactFormData.phone%>">
  </fieldset>
  <fieldset>
    <legend>Wedding Information</legend>
      <label>Wedding Date</label>
        <input type="text" name="date" id="datepicker" size="30" readonly="true"/>
      <label>Ceremony Location</label>
        <input type="text" name="ceremonyLoc" id="ceremonyLoc" value="<%=contactFormData.ceremonyLoc%>">
      <label>Reception Location</label>
        <input type="text" name="receptionLoc" id="receptionLoc" value="<%=contactFormData.receptionLoc%>">
        <input type="hidden" name="scriptrun" value="*">
  </fieldset>
  <fieldset>
    <legend>Additional Comments</legend>
      <label>Comments</label>
        <textarea name="comments" cols="25" rows="5" id="comments"><%=contactFormData.comments%></textarea>
  </fieldset>
