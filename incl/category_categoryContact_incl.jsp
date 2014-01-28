  
  <form id="form1" name="form1" method="post" action="/category-response.jsp" class="category-contact">
  <h2>Contact vendors in this category</h2>
  <%@ include file="contactFormJs_incl.jsp" %>
  <%@ include file="ContactFormSetup_incl.jsp" %>
  <%@ include file="contact_form_incl.jsp" %>
  
  <fieldset class="checks">
      <legend>Wedding Professionals</legend>
      <p>
         Check "Select all" to have all the professionals in this category respond to
         your request. You may uncheck those professionals you do not wish to contact.
      </p>
      <div>
        <ul class="checkboxes">
        <li>
          <input type="checkbox" name="all" id="all" value="all" onclick="checkAll(document.form1.vendor);" />
          <label>Select All</label>
        </li>
      <x:forEach select="$doc/WGBE/region/categories/category/profileSets/profileSet/profiles/profile" var="profile">
        <li>
          <input type="checkbox" name="vendor" id="vendor" value="<x:out select="$profile/@id"/>" />
          <label><x:out select="$profile/@vendorName"/></label>
        </li>
     </x:forEach>
        </ul>
      </div>
  </fieldset>
  <fieldset>
    <input type="hidden" name="category" id="category" value="<x:out select="$doc/WGBE/region/categories/category/@id"/>">
    <button type="submit" id="submit" onclick="return(validateForm(this.form, document.form1.vendor));">Submit</button>
    <button type="reset" id="cancel">Cancel</button>
  </fieldset>
</form>
