<script>
   function getAjaxRequestObject()
   {
      var ajaxRequest;
      try
      {
         ajaxRequest = new XMLHttpRequest();
      }
      catch (e)
      {
         try
         {
            ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
         }
         catch (e)
         {
            try
            {
               ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e)
            {
               alert("Browser not supported for attribute updates");
               return false;
            }
         }
      }
      return( ajaxRequest );
   }

   function getEmailExpandCollapse( elementId, image, messageId, id )
   {
      expandIt( elementId, image );

      var ajaxRequest = getAjaxRequestObject();

      var mailContainer = document.getElementById( elementId );
      ajaxRequest.onreadystatechange = function() { displayMailContents( ajaxRequest, mailContainer );} ;

      ajaxRequest.open("GET", "ajaxGetMailMessage.jsp?messageId="+messageId+"&id="+id, true);
      ajaxRequest.send(null);
   }

   function displayMailContents( ajaxRequest, mailContainer )
   {
      if(ajaxRequest.readyState == 4)
      {
         mailContainer.innerHTML = ajaxRequest.responseText;
      }
   }

</script>
