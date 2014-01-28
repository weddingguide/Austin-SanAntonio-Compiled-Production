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

      function addChildWorkItems( ajaxRequest, parentId  )
      {
         if(ajaxRequest.readyState == 4)
         {
            var separatorNdx = ajaxRequest.responseText.indexOf( "~#~#~" );


            var newLIs = ajaxRequest.responseText.substr( separatorNdx+5 );
//          alert( "newLIs" + newLIs );
            var liID = "#wi"+parentId;
            $(liID).append( $(newLIs) );

            var newTRs = ajaxRequest.responseText.substr( 0, separatorNdx );
//          alert( "newTRs" + newTRs );
            var trID = "#wi"+parentId+"tr";
            $(newTRs).insertAfter( $(trID) );

         }
      }


      function expandCollapse( parentId, nestLevel, byAssignedId, compressedView )
      {
         var liElement = document.getElementById( "wi"+parentId );
         var childNodes = liElement.getElementsByTagName("li"); // all child LIs
         if ( childNodes.length == 0 )
         {
            var ajaxRequest = getAjaxRequestObject();
            ajaxRequest.onreadystatechange = function() { addChildWorkItems( ajaxRequest, parentId );} ;
            ajaxRequest.open("GET", "/itemtrack/jsp/user/ajaxChildWorkItems.jsp?parentWorkItem="+parentId+"&nestLevel="+nestLevel+"&assignedId="+byAssignedId+"&compressed="+compressedView+"&debug", true);
            ajaxRequest.send(null);
         }

         twistyElement = document.getElementById( "twisty"+parentId );

         if( twistyElement.src.indexOf( "plus") > 0 )
         {
            rc = expand( parentId );
            twistyElement.src = "/images/minus.gif";
         }
         else
         {
            rc = collapse( parentId );
            twistyElement.src = "/images/plus.gif";
         }
      }

      function expand( parentId )
      {
         var ulElement = document.getElementById( "wi"+parentId );
         if ( ulElement == null ) return;
         // use ul mirror to get parent/child relationships... ( we're emulating parent/child in table )
         var childNodes = ulElement.querySelectorAll("li#wi"+parentId+">ul>li"); // only immediate child LIs get expanded
         for ( var i = 0; i < childNodes.length; i++ )
         {
               var childId = childNodes[i].id + "tr";
               rowElement = document.getElementById( childId );
               rowElement.style.display = "";
         }
      }

      function collapse( parentId )
      {
         var ulElement = document.getElementById( "wi"+parentId );
         if ( ulElement == null ) return;
         var childNodes = ulElement.getElementsByTagName("li"); // all child LIs get collapsed
         for ( var i = 0; i < childNodes.length; i++ )
         {
            var childId = childNodes[i].id + "tr";
            rowElement = document.getElementById( childId );
            rowElement.style.display = "none";
         }
      }
   </script>

    <div id="ul_mirror" style="display:none">
         <ul>
            <x:forEach select="$workitemList/workItem" var="thisWorkItem">
               <li id="wi<x:out select="$thisWorkItem/@id"/>">
                  <x:out select="$thisWorkItem/@description"/>
               </li>
            </x:forEach>
         </ul>
     </div>
