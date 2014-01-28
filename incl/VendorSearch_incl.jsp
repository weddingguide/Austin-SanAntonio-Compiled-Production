<script>
      function validate()
      {
         if (   document.vendorSearch.search.value.length < 2 )
         {
            alert( "Please enter at least two characters in search field." );
            return(false);
         }
         return(true);
      }
</script>

                    <h1>Search</h1>
                    <form name=vendorSearch action=/category.jsp method=post onSubmit='return(validate())'>
                        <h3>professionals by name:</h3>
                        <input type="text" name="search">
                        <input type="submit" value="Go">
                    </form>