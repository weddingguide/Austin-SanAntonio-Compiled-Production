<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script>
  function validateForm(form, vendors)
  {
     if ( form.lastName.value == "" )
     {
        alert( "Please enter your last name." );
        return(false);
     }

     if ( form.email.value == "" )
     {
        alert( "Please enter your email address." );
        return(false);
     }

     var filter=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
     if (filter.test(form.email.value) == false)
     {
        alert("Please input a valid email address.")
        return(false);
     }

     if (form.date.value == ""){
        alert("Please pick a wedding date.")
        return (false);
     }

  <% if (request.getParameter("businessEntityId") == null ) { %>

      for ( i = 0; i < 500; i++ )
      {
         {
            if ( vendors[i] == null ) break;  // if null we've reached the end
            if ( vendors[i].checked == true ) return(true);
         }
      }
      alert( "You must select at least one Wedding Professional to contact." );
      return(false);
  <% } %>
  
  form.scriptrun.value = new Date();
   return(true);
  }

  checked=false;

   function checkAll(vendors)
   {
      if (checked == false)
      {
         checked = true
      }
      else
      {
         checked = false
      }
      for ( i = 0; i < 500; i++ )
      {
         {
            if ( vendors[i] == null ) break;  // if null we've reached the end
            vendors[i].checked= checked;
         }
      }
   }
</script>

<script>
  $(function() {
    $( "#datepicker" ).datepicker({dateFormat:"yy-mm-dd " });
    $( "select[name='me']").focusin( function() {
      $(".tool-tip").fadeIn('500'); 
    });
    $( "select[name='me']").focusout( function() {
      $(".tool-tip").fadeOut('500');
    });
  });
</script>