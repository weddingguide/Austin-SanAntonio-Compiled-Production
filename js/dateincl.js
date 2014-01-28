  function setDays( form, datePrefix, theDay, dateSuffix )
  {
     monthObj = form[datePrefix+"Month"+dateSuffix];
     dayObj   = form[datePrefix+"Day"+dateSuffix];
     yearObj  = form[datePrefix+"Year"+dateSuffix]

     var numDays = 31;
     theMonth  = (monthObj.selectedIndex)+1;
     theYearNdx = yearObj.selectedIndex;
     theYear = yearObj.options[theYearNdx].value;

     if ( theMonth == 4 ) numDays = 30;
     if ( theMonth == 6 ) numDays = 30;
     if ( theMonth == 9 ) numDays = 30;
     if ( theMonth == 11 ) numDays = 30;
     if ( theMonth == 2 )
     {
        numDays = 28;
        if ( theYear % 4  == 0 ) numDays = 29;
     }

     theDay = dayObj.selectedIndex;

     dayObj.options.length = numDays;

     for ( i=0; i < numDays; i++)
     {
        dayObj.options[i] = new Option(i+1);   // set the text for the drop down item
        dayObj.options[i].value = (""+(i+101)).substring(1,3);         // set the value for the drop down item
     }
     if ( theDay <  numDays ) dayObj.options[theDay].selected = "true";

     return(true);
  }
