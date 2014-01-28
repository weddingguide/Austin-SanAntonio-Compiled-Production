<select id=<%= datePrefix + "Month"+ dateSuffix %> onChange="ajaxWorkItemUpdate('<%=datePrefix%>', 'date', <%=workItemId%>, 'workitem<%=workItemId%>'); setDays( this.form, <%= "'"+datePrefix+"'" %>, <%= theDay %>, <%= "'"+dateSuffix+"'" %>  );">
()
  <option <% if (theMonth ==  1) out.print ( " SELECTED " ); %> value=01>Jan</option>
  <option <% if (theMonth ==  2) out.print ( " SELECTED " ); %> value=02>Feb</option>
  <option <% if (theMonth ==  3) out.print ( " SELECTED " ); %> value=03>Mar</option>
  <option <% if (theMonth ==  4) out.print ( " SELECTED " ); %> value=04>Apr</option>
  <option <% if (theMonth ==  5) out.print ( " SELECTED " ); %> value=05>May</option>
  <option <% if (theMonth ==  6) out.print ( " SELECTED " ); %> value=06>Jun</option>
  <option <% if (theMonth ==  7) out.print ( " SELECTED " ); %> value=07>Jul</option>
  <option <% if (theMonth ==  8) out.print ( " SELECTED " ); %> value=08>Aug</option>
  <option <% if (theMonth ==  9) out.print ( " SELECTED " ); %> value=09>Sep</option>
  <option <% if (theMonth == 10) out.print ( " SELECTED " ); %> value=10>Oct</option>
  <option <% if (theMonth == 11) out.print ( " SELECTED " ); %> value=11>Nov</option>
  <option <% if (theMonth == 12) out.print ( " SELECTED " ); %> value=12>Dec</option>
</select>

<select id=<%= datePrefix + "Day"  + dateSuffix %> onChange="ajaxWorkItemUpdate('<%=datePrefix%>', 'date', <%=workItemId%>, 'workitem<%=workItemId%>');; setDays( this.form, <%= "'"+datePrefix+"'" %>, <%= theDay %>, <%= "'"+dateSuffix+"'" %>  );">
   <%   numDays = 31;
        if ( theMonth == 4 ) numDays = 30;
        if ( theMonth == 6 ) numDays = 30;
        if ( theMonth == 9 ) numDays = 30;
        if ( theMonth == 11 ) numDays = 30;
        if ( theMonth == 2 )
        {
           numDays = 28;
           if ( theYear % 4  == 0 ) numDays = 29;
        }
        for ( int i = 1; i <= numDays; i++ )
        {
           out.print("<option " );
           if (theDay ==  i) out.print ( " SELECTED " );
           out.println( "value=" + ((new Integer(100+i)).toString()).substring(1,3) + ">" + i + "</option>" );
        }
   %>
</select>

<select id=<%= datePrefix + "Year" + dateSuffix %> onChange="ajaxWorkItemUpdate('<%=datePrefix%>', 'date', <%=workItemId%>, 'workitem<%=workItemId%>');; setDays( this.form, <%= "'"+datePrefix+"'" %>, <%= theDay %>, <%= "'"+dateSuffix+"'" %>  );">
  <% for ( int yy = dateBeginYear; yy < dateEndYear; yy++ )
     {
  %>
        <option <% if (theYear == yy) out.print ( " SELECTED " ); %> value="<%=yy%>" ><%=yy%></option>
  <% } %>
</select>
