<form id="form1" name="form1" method="post" action="contact-response">
  <h2>Contact Us</h2>
  <%@ include file="contactFormJs_incl.jsp" %>
  <%@ include file="ContactFormSetup_incl.jsp" %>
  <%@ include file="contact_form_incl.jsp" %>

  <input type="hidden" name="vendor" id="businessEntityId" value="<x:out select="$doc/WGBE/region/categories/category/profiles/profile/@id" />">
  <button type="submit" id="submit" onclick="return(validateForm(this.form, document.form1.vendor));">Submit</button>
  <button type="reset" id="cancel">Cancel</button>
</form>
