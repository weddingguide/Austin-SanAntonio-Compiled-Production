
<SCRIPT LANGUAGE="JavaScript">

   // Compare two options within a list by VALUES

   function compareOptionValues(a, b)
   {
     // Radix 10: for numeric values
     // Radix 36: for alphanumeric values
     var sA = parseInt( a.value, 36 );
     var sB = parseInt( b.value, 36 );
     return sA - sB;
   }

   // Compare two options within a list by TEXT

   function compareOptionText(a, b)
   {
     if (a.text.toUpperCase() < b.text.toUpperCase() ) return( -1 );
     if (a.text.toUpperCase() > b.text.toUpperCase() ) return(  1 );
     return 0;
   }

   // Dual list move function

   function moveDualList( srcList, destList, moveAll )
   {
     // Do nothing if nothing is selected

     if (  ( srcList.selectedIndex == -1 ) && ( moveAll == false )   )
     {
       return;
     }

     newDestList = new Array( destList.options.length );
     var len = 0;

     for( len = 0; len < destList.options.length; len++ )
     {
       if ( destList.options[ len ] != null )
       {
         newDestList[ len ] = new Option( destList.options[ len ].text, destList.options[ len ].value, destList.options[ len ].defaultSelected, destList.options[ len ].selected );
       }
     }

     for( var i = 0; i < srcList.options.length; i++ )
     {
       if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )
       {
          // Statements to perform if option is selected
          // Incorporate into new list

          newDestList[ len ] = new Option( srcList.options[i].text, srcList.options[i].value, srcList.options[i].defaultSelected, srcList.options[i].selected );
          len++;
       }
     }

     // Sort out the new destination list

     //newDestList.sort( compareOptionValues );   // BY VALUES
     newDestList.sort( compareOptionText );   // BY TEXT

     // Populate the destination with the items from the new array

     for ( var j = 0; j < newDestList.length; j++ )
     {
       if ( newDestList[ j ] != null )
       {
         destList.options[ j ] = newDestList[ j ];
       }
     }

     // Erase source list selected elements

     for( var i = srcList.options.length - 1; i >= 0; i-- )
     {
       if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )
       {
          // Erase Source
          //srcList.options[i].value = "";
          //srcList.options[i].text  = "";
          srcList.options[i]       = null;
       }
     }

   } // End of moveDualList()

   function selectAllEntries( srcList )
   {
     for( var i = 0; i < srcList.options.length; i++ )
     {
       srcList.options[i].selected = true;
     }
     return(true);
   }


   function openDetailsWindow( theForm )
   {
      for( var j = 0; j < theForm.listRight.options.length; j++ )
      {
         if ( theForm.listRight.options[j] != null && ( theForm.listRight.options[j].selected == true ))
         {
             var details = getDetails(theForm.listRight.options[j].value);
             detailsWindow= this.location.href = details+"?detailsownerid="+theForm.personId.value+"&groupNum="+theForm.listRight.options[j].value+"&businessEGId="+theForm.businessEGId.value+"&parm1="+theForm.parm1.value ;
         }
      }
       return(false);
   }


   function updateDetailsLink(theForm)
   {
      theForm.details_button.disabled = true;

      var selectedCount = 0;

      for( var j = 0; j < theForm.listRight.options.length; j++ )
      {
         if ( theForm.listRight.options[j] != null && ( theForm.listRight.options[j].selected == true ))
         {
            selectedCount++;
            if ( selectedCount > 1 )
            {
                // more than one item is selected... can't do details now... disable and exit
                theForm.details_button.disabled = true;
                return( false );
            }
             var details = getDetails(theForm.listRight.options[j].value);
            if ( details != "" ) theForm.details_button.disabled = false;
         }
      }
   }


</script>



