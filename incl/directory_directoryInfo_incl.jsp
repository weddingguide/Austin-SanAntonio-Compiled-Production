      <!-- Directory Key Fixed position Script -->
      <script type="text/javascript">
        //Floating Element Script//
        $(document).ready(function () {  
            var top = $('.vd-key').offset().top - parseFloat($('.vd-key').css('marginTop').replace(/auto/, 0));
            $(window).scroll(function (event) {
                // what the y position of the scroll is
                var y = $(this).scrollTop();
  
                // whether that's below the form
                if (y >= top) {
                    // if so, ad the fixed class
                    $('.vd-key').addClass('fixed');
                    $('.vd-container').addClass('padded');
                } else {
                    // otherwise remove it
                    $('.vd-key').removeClass('fixed');
                    $('.vd-container').removeClass('padded');
                }
            });
        });
        </script>
        <x:if select="$doc/WGBE/region/categories/category/@id = '36'">
        <h1>Venues Directory</h1>
        <div>
                <span>
                        <a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back to Planning Tools</a>
                </span>
        </div>
        <p>Browse through the directory below to view range of services our Venues professionals provide, as well as other details that will beuseful when narrowing down your choice of a wedding facility. Click on a company name to view the profile!</p>
        </x:if>
        <x:if select="$doc/WGBE/region/categories/category/@id = '3'">
        <h1>Accomodations Directory</h1>
        <div>
                <span>
                        <a href="javascript:history.go(-1)"><img src="/img/arrow_pink.png" /> Back to Planning Tools</a>
                </span>
        </div>
        </x:if>