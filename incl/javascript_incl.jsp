      <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
      <!-- Slider JS -->
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
      <script src="http://austin.texasweddingsltd.net/js/jquery.touchSwipe.min.js"></script>
      <script src="http://austin.texasweddingsltd.net/js/jquery.wmuSlider.js"></script>
      <script src="http://austin.texasweddingsltd.net/js/jquery.wmuGallery.js"></script>

    <!-- Mobile Menu JS -->
      <script>
         $(function() {  
            var pull        = $('#pull');  
               menu        = $('nav ul');  
               menuHeight  = menu.height();  
  
            $(pull).on('click', function(e) {  
                 e.preventDefault();  
               menu.slideToggle();  
            });  
         });
         $(window).resize(function(){  
            var w = $(window).width();  
            if(w > 320 && menu.is(':hidden')) {  
               menu.removeAttr('style');  
            }  
         });  
      </script>
      
      <!-- Bidget Calculator Script -->
      <script type="text/javascript" src="http://austin.texasweddingsltd.net/js/bootstrap.js"></script>
      <script type="text/javascript" src="http://austin.texasweddingsltd.net/js/bridalcalc.js"></script>

      <!-- Popup window function-->
      <script type="text/javascript">
        function popUp(url){
               newwindow=window.open(url,'name','height=700,width=810,scrollbars=yes');
              if (window.focus) {newwindow.focus()}
              return false;
         }
      </script>



