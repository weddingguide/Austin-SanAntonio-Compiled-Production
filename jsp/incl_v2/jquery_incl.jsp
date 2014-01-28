<link rel="stylesheet" href="/js/jquery-ui-1.10.1.custom/css/smoothness/jquery-ui-1.10.1.custom.css">
<!-- link rel="stylesheet" href="/css/timepicker.css" -->
<script src="/js/jquery-ui-1.8.21.custom/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery-ui-1.8.21.custom/js/jquery-ui-1.8.21.custom.min.js"></script>
<script src="/js/jquery-ui-timepicker-addon.js"></script>

        <script>
           $(document).ready
           (  function()
              {
                  $('.datepicker').each(function()
                     {
                         $(this).datepicker({ dateFormat: 'yy-mm-dd' });
                     }
                  );
              }
           );

           $( function()
                         {
                           $("#datepicker").datetimepicker(
                              {
                                 dateFormat: 'DD, MM d, yy',
                                 ampm: true
                              }
                           );
                         }
            );

           $(document).ready
           (  function()
              {
                  $('.datetimepicker').each(function()
                     {
                         $(this).datetimepicker({ dateFormat: 'yy-mm-dd' });
                         $(this).datetimepicker({ timeFormat: 'HH:mm' });
                     }
                  );
              }
           );

           $( function()
                         {
                           $("#datetimepicker").datetimepicker(
                              {
                                 dateFormat: 'yy-mm-dd',
                                 timeFormat: 'HH:mm',
                                 ampm: true
                              }
                           );
                         }
            );
        </script>
