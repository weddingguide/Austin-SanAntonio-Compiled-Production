
  function validateForm(form)
  {
     form.scriptrun.value = new Date();


     var contactTypeValue = '';
     for(var i = 0; i < form.contactType.length; i++)
     {
        if(form.contactType[i].checked)
        {
           contactTypeValue = form.contactType[i].value;
        }
     }
     if ( contactTypeValue == 'wedding' )
     {
        var weddingDate = new Date();
        var today = new Date();
        weddingDate.setFullYear( form.dateYear.value, form.dateMonth.value-1, form.dateDay.value ); // note -- months need to be ndx 0
        if ( weddingDate.getTime() <= today.getTime() )
        {
           alert( "The wedding date must be a future date. (" + form.dateMonth.value+"/"+form.dateDay.value+"/"+form.dateYear.value + " was specified)." );
           return(false);
        }

        if (( form.brideLastName.value == "" ) && (form.groomLastName.value == "" ))
        {
           alert( "Please enter a last name for either the bride or the groom." );
           return(false);
        }
     }
     if ( contactTypeValue == 'otherEventType' )
     {
        var eventDate = new Date();
        var today = new Date();
        eventDate.setFullYear( form.dateYear_event.value, form.dateMonth_event.value-1, form.dateDay_event.value ); // note -- months need to be ndx 0
        if ( eventDate.getTime() <= today.getTime() )
        {
           alert( "The event date must be a future date. (" + form.dateMonth_event.value+"/"+form.dateDay_event.value+"/"+form.dateYear_event.value + " was specified)." );
           return(false);
        }
        if ( form.myContactLastName.value == "" )
        {
           alert( "Please enter your last name." );
           return(false);
        }
     }
     if ( contactTypeValue == 'generalContact' )
     {
        if ( form.myContactLastName.value == "" )
        {
           alert( "Please enter your last name." );
           return(false);
        }
     }


     if (( form.emailAddress_contact_0.value == "" ) && (form.emailAddress_contact_1.value == "" )&& (form.phoneNumber_contact_0.value == "" ))
     {
        alert( "Please enter either an email address or a phone number." );
        return(false);
     }

     return(true);
  }

  function setOtherVisible(selection)
  {
     var theDiv = document.getElementById( "otherName" );
     if (selection.value == "other" )
     {
        theDiv.style.display = 'block';
     }
     else
     {
        theDiv.style.display = 'none';
     }
     return(true);
  }


  function selectContactForm(selection)
  {
     var weddingDiv = document.getElementById( "wedding" );
     var eventDiv = document.getElementById( "event" );
     var myNameDiv = document.getElementById( "myName" );
     var generalInfoDiv = document.getElementById( "generalInfo" );
     var commonDiv = document.getElementById( "common" );

     if (selection.value == "wedding" )
     {
        weddingDiv.style.display          = 'block';
        eventDiv.style.display          = 'none';
        myNameDiv.style.display           = 'none';
        generalInfoDiv.style.display      = 'none';
        commonDiv.style.display           = 'block';
     }
     if (selection.value == "otherEventType" )
     {
        weddingDiv.style.display         = 'none';
        eventDiv.style.display          = 'block';
        myNameDiv.style.display           = 'block';
        generalInfoDiv.style.display      = 'none';
        commonDiv.style.display           = 'block';
     }
     if (selection.value == "generalContact" )
     {
        weddingDiv.style.display         = 'none';
        eventDiv.style.display          = 'none';
        myNameDiv.style.display           = 'block';
        generalInfoDiv.style.display      = 'block';
        commonDiv.style.display           = 'block';
     }
     return(true);
  }
