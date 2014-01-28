<% String pageTitle = "Format as Labels"; %>
<%@ include file="../incl/AppHeader.jsp" %>

          <p> The labels will be formatted for Avery Labels 5160 mailing labels  3 rows x 10 columns.
          <p>Click "Format" below, then select "Open" when the Open/Save popup appears.
          <p>Select first label position to use:


   <form name="form1" method="post" action="../../Avery5160.rtf">
          <table border=1 width="35%">
            <tr>
              <td align=center><input width="33%" type=radio name=firstlabel id=firstlabel value=1 checked ></td>
              <td align=center><input width="33%" type=radio name=firstlabel id=firstlabel value=2></td>
              <td align=center><input width="33%" type=radio name=firstlabel id=firstlabel value=3></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=4></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=5></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=6></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=7></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=8></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=9></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=10></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=11></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=12></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=13></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=14></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=15></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=16></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=17></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=18></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=19></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=20></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=21></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=22></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=23></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=24></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=25></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=26></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=27></td>
            </tr>
            <tr>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=28></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=29></td>
              <td align=center><input type=radio name=firstlabel id=firstlabel value=30></td>
            </tr>
          </table>
        </div>
        <input type=submit name=submit id=submit value="Format">
        <input type=hidden name=families id=submit value=<%=request.getParameter( "families" ) %> >
     </form>


</body>
</html>
<%@ include file="../incl/AppFooter.jsp" %>
