
          <%
             String addressLabel;
             String addressType;
             Address address;

             String emailLabel;
             String emailType;
             Email email;

             String phoneLabel;
             String phoneType;
             Phone phone;

             Person person = new Person( dbData, -1 );
             person.deepPopulate();
             String personLabel = "_client";
             String personType  = "Client";
          %>

     <% emailLabel = personLabel+"_0";
        emailType  = "";
        email = person.getEmail();

        boolean search = true;
        boolean forceReadWrite = true;

     %>
        <% { // requires a block due to redef of readOnly in the next include

          boolean readOnly = false;
        %>
         <%@ include file="emailincl.jsp" %>
        <% } %>

     <button name="Submit" type="submit" onClick='return(validateForm(this.form))'>Submit</button>

     <input type=hidden name=requirefullyspecified value=true>  <!-- cannot enter a part of the email address and locate it -->


     <div style="visibility:hidden;" >
         <%@ include file="std_person_entry_block.jsp" %>
     </div>
</form>

<script>
      function validateForm( form )
      {
         if (   form.emailAddress_client_1.value == "" )    // std block above will only create one of the three email fields since 'search' is true;
         {
            alert( "An email address is required" );
            return(false);
         }
         return(true);
      }
</script>
