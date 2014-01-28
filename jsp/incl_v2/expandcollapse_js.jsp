   <script>
      function expandIt( El, whichIm )
      {

//       var allTags = document.body.getElementsByTagName('img');
//       var ids = [];
//       for (var tg = 0; tg< allTags.length; tg++)
//       {
//          var tag = allTags[tg];
//          if (tag.id)
//          {
//             ids.push(tag.id);
//          }
//       }
//       alert(ids);


         whichEl = document.getElementById( El );
//       whichEl = eval( El );
         if (whichEl.style.display == "none")
         {
            whichEl.style.display = "block";
            whichIm.src = "/images/minus.gif";
         }
         else
         {
            whichEl.style.display = "none";
            whichIm.src = "/images/plus.gif";
         }
      }

      function expandIt2( El, whichIm )
      {
         whichEl = document.getElementById( El );
         if (whichEl.style.display == "none")
         {
            whichEl.style.display = "";
            whichIm.src = "/images/minus.gif";
         }
         else
         {
            whichEl.style.display = "none";
            whichIm.src = "/images/plus.gif";
         }
      }

      function expandCollapseWithEdit( roData, editData, icon, editFlag  )
      {
         roDataElement = document.getElementById( roData );
         editDataElement = document.getElementById( editData );
         iconElement = document.getElementById(icon);

         if ((roDataElement.style.display == "none")
            && (editDataElement.style.display == "none")) // both are collapsed;
         {
            if ( editFlag == "false" )
            {
               roDataElement.style.display = "block";
               editDataElement.style.display = "none";
            }
            else
            {
               roDataElement.style.display = "none";
               editDataElement.style.display = "block";
            }
            iconElement.src = "/images/minus.gif";
         }
         else //currently expanded
         {
            if ( editFlag == "false" ) // this means the +/- icon was clicked; just collapse both
            {
               roDataElement.style.display = "none";
               editDataElement.style.display = "none";
               iconElement.src = "/images/plus.gif";

            }
            else // currently expanded, but edit icon was pressed, swap
            {
               if (roDataElement.style.display == "none")
               {
                  roDataElement.style.display = "block";
                  editDataElement.style.display = "none";
               }
               else
               {
                  roDataElement.style.display = "none";
                  editDataElement.style.display = "block";
               }
            }
         }
      }

      function expandCollapseSegmentEdit( ndx, segmentDefId )
      {
         expandCollapseWithEdit("ROSegmentDefName_"+ndx+"_"+segmentDefId, "EditSegmentDefName_"+ndx+"_"+segmentDefId, "ImgSegmentDefName_"+ndx+"_"+segmentDefId, 'true');
         expandCollapseWithEdit("ROSegmentDefDisplay_"+ndx+"_"+segmentDefId, "EditSegmentDefDisplay_"+ndx+"_"+segmentDefId, "ImgSegmentDefDisplay_"+ndx+"_"+segmentDefId, 'true');
         expandCollapseWithEdit("ROSegmentDefStatus_"+ndx+"_"+segmentDefId, "EditSegmentDefStatus_"+ndx+"_"+segmentDefId, "ImgSegmentDefStatus_"+ndx+"_"+segmentDefId, 'true');
      }

   </script>
