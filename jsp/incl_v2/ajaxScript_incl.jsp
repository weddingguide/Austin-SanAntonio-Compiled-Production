
<script>
   var ddlistWindow = null;

   function popupPage( field )
   {
         ddlistWindow = window.open("attributeresourcegallery.jsp?popup=*&fieldName="+field+"&ownerId=<%=ownerId%>&ownerType=<%=ownerType%>",
                                    "Popup",
                                    "height=490,width=600,resizable=1,scrollbars=1");
      ddlistWindow.focus();

      return(false);
   }
</script>



<script language="javascript" type="text/javascript">
<!--
function ajaxAttributeUpdate(theForm, fieldName, datatype, parms, attributeProperty )
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
   var dataValue = "";
   if (  datatype==7 )
   {
      if ( theForm[fieldName].checked ) dataValue = "checked";
      else dataValue = "unchecked"
   }
   else if (( attributeProperty == 'bgnDate' ) || (attributeProperty == 'endDate') || ( attributeProperty == 'dateAttribute'))
   {
     monthObj = theForm[fieldName+"Month"];
     dayObj   = theForm[fieldName+"Day"];
     yearObj  = theForm[fieldName+"Year"]

     theDay    = (dayObj.selectedIndex)+1;
     theMonth  = (monthObj.selectedIndex)+1;
     theYearNdx = yearObj.selectedIndex;
     theYear = yearObj.options[theYearNdx].value;

     dataValue = theYear + '-' + right('0'+theMonth,2) + '-' + right('0'+theDay, 2);
   }
   else
   {
      dataValue = theForm[fieldName].value;
   }
   dataValue = encodeURIComponent(dataValue );


   var params = "value="+dataValue+"&"+parms+"&ownerId=<%=ownerId%>&ownerType=<%=ownerType%>&attributeProperty="+attributeProperty;

   ajaxRequest.onreadystatechange = function()
                                    {
                                       if(ajaxRequest.readyState == 4)
                                       {
                                           if ( ajaxRequest.responseText.replace(/^\s+|\s+$/g,"") != "Ok" ) alert( "["+ajaxRequest.responseText.replace(/^\s+|\s+$/g,"")+"]");

                                       }
                                    }

   ajaxRequest.open("POST", "/cis/jsp/operator/ajaxAttributeUpdate.jsp", true);
   try
   {
      ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      ajaxRequest.setRequestHeader("Content-length", params.length);
      ajaxRequest.setRequestHeader("Connection", "close");
   }
   catch( e )
   {
      alert( e );
   }
   ajaxRequest.send(params);

}

function right(str, n){
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}

//-->
</script>

<script language="javascript" type="text/javascript">
<!--

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


function addSubAttribute(theForm, fieldName, datatype, parms, tableId, id, subId, ndx )
{
   var rowNdx = document.getElementById( "row_"+id+"_0_"+ndx ).rowIndex;

   var attributeTable = document.getElementById( tableId );
   var newRow = attributeTable.insertRow(rowNdx+1)
   newRow.id =  "row_"+id+"_"+subId+"_"+ndx;

   var ajaxRequest = getAjaxRequestObject();
   ajaxRequest.onreadystatechange = function() { updateRowContents( ajaxRequest, newRow );} ;

   ajaxRequest.open("GET", "ajaxAddAttribute.jsp?"+parms+"&ownerId=<%=ownerId%>&ownerType=<%=ownerType%>&attributeProperty='+attributeProperty", true);
   ajaxRequest.send(null);

}

function addAttributeInstance(theForm, fieldName, datatype, parms, tableId, id, subId, ndx )
{
   var attributeTable = document.getElementById( tableId );
   var availableNdx;
   for (ndxTest = 0; ndxTest<1000; ndxTest++)
   {
      try
      {
         var rowTest = document.getElementById( "row_"+id+"_0_"+ndxTest ).rowIndex;
      }
      catch( e )
      {
         availableNdx = ndxTest;
         break;
      }
   }
   var rowNdx;
   for (rowNdx = document.getElementById( "row_"+id ).rowIndex; rowNdx < attributeTable.rows.length; rowNdx++ )
   {
     var rowId = attributeTable.rows[ rowNdx ].id + "_-1_-1";
     rowIdParts = rowId.split("_");
     if (rowIdParts[1] != id ) break;
     if (rowIdParts[3] > availableNdx ) break;
   }

   var newRow = attributeTable.insertRow(rowNdx) // insert here
   newRow.id =  "row_"+id+"_0_"+availableNdx;

   var ajaxRequest = getAjaxRequestObject();
   ajaxRequest.onreadystatechange = function() { updateRowContents( ajaxRequest, newRow );} ;

   ajaxRequest.open("GET", "ajaxAddAttribute.jsp?instance="+availableNdx+"&"+parms+"&ownerId=<%=ownerId%>&ownerType=<%=ownerType%>", true);
   ajaxRequest.send(null);

}

function updateRowContents( ajaxRequest, newRow )
{
   if(ajaxRequest.readyState == 4)
   {
      newRow.innerHTML = ajaxRequest.responseText;
   }
}

function rmvAttribute(theForm, fieldName, datatype, parms, tableId, id, subId, ndx )
{
   if (!confirm( "Confirm delete..." )) return( false );

   var rowNdx = document.getElementById( "row_"+id+"_"+subId+"_"+ndx ).rowIndex;

// alert(  "row_"+id+"_"+subId+"_"+ndx + " = " + rowNdx);

   var attributeTable = document.getElementById( tableId );
   var deleteNdx = rowNdx;  // as we delete, rows move up, the ndx to delete is constant
   attributeTable.deleteRow(deleteNdx)
   if ( subId == 0 ) // this is the root attribute; remove subAttributes
   {
      for (rowNdx = rowNdx;; rowNdx++ )
      {
        var rowId = attributeTable.rows[ deleteNdx ].id + "_-1_-1";
        rowIdParts = rowId.split("_");
        if (rowIdParts[3] != ndx) break;
        // id and ndx are the same; remove it
        attributeTable.deleteRow(deleteNdx);
        if (deleteNdx >= attributeTable.rows.length) break;
      }
   }

   var ajaxRequest = getAjaxRequestObject();
   ajaxRequest.onreadystatechange = function()
                                    {
                                       if(ajaxRequest.readyState == 4)
                                       {
                                           if ( ajaxRequest.responseText.replace(/^\s+|\s+$/g,"") != "Ok" ) alert( "["+ajaxRequest.responseText.replace(/^\s+|\s+$/g,"")+"]");

                                       }
                                    }
   ajaxRequest.open("GET", "ajaxRemoveAttribute.jsp?"+parms+"&ownerId=<%=ownerId%>&ownerType=<%=ownerType%>&attributeProperty='+attributeProperty", true);
   ajaxRequest.send(null);

}
//-->

</script>
