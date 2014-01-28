<table>
   <tr>
      <td rowspan=2>
         <select name=<%= timePrefix + "Hour" + timeSuffix %> >
           <option <% if (theHour ==  1) out.print ( " SELECTED " ); %> value=1>1</option>
           <option <% if (theHour ==  2) out.print ( " SELECTED " ); %> value=2>2</option>
           <option <% if (theHour ==  3) out.print ( " SELECTED " ); %> value=3>3</option>
           <option <% if (theHour ==  4) out.print ( " SELECTED " ); %> value=4>4</option>
           <option <% if (theHour ==  5) out.print ( " SELECTED " ); %> value=5>5</option>
           <option <% if (theHour ==  6) out.print ( " SELECTED " ); %> value=6>6</option>
           <option <% if (theHour ==  7) out.print ( " SELECTED " ); %> value=7>7</option>
           <option <% if (theHour ==  8) out.print ( " SELECTED " ); %> value=8>8</option>
           <option <% if (theHour ==  9) out.print ( " SELECTED " ); %> value=9>9</option>
           <option <% if (theHour == 10) out.print ( " SELECTED " ); %> value=10>10</option>
           <option <% if (theHour == 11) out.print ( " SELECTED " ); %> value=11>11</option>
           <option <% if (theHour == 12) out.print ( " SELECTED " ); %> value=12>12</option>
         </select>
      </td>
      <td rowspan=2>
          :
      </td>
      <td rowspan=2>
         <select name=<%= timePrefix + "Minute" + timeSuffix %> >
           <option <% if (theMinute <  15) out.print ( " SELECTED " ); %> >00</option>
           <option <% if ((theMinute >= 15) && (theMinute < 30)) out.print ( " SELECTED " ); %> >15</option>
           <option <% if ((theMinute >= 30) && (theMinute < 45)) out.print ( " SELECTED " ); %> >30</option>
           <option <% if ((theMinute >= 45) && (theMinute < 60)) out.print ( " SELECTED " ); %> >45</option>
         </select>
      </td>
      <td style="font-size:9pt">
        <input type=radio name=<%= timePrefix + "AMPM" + timeSuffix %> <% if (theAMPM == 0) out.print ( " CHECKED " ); %> value=0>AM
      </td>
   </tr>
   <tr>
      <td style="font-size:9pt">
        <input type=radio name=<%= timePrefix + "AMPM" + timeSuffix %> <% if (theAMPM == 1) out.print ( " CHECKED " ); %> value=1>PM
      </td>
   </tr>
</table>
