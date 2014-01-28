            <%
              {
                SiteDefEntityTypeList statusList = new SiteDefEntityTypeList( dbData, person.getRecordType() );

               if ( statusList.getRecordList().length > 0 )
               {
            %>
                  <table class=row1 width=100% border=1>
                    <tr>
                      <th>
                         With this classification:
                      </th>
                    </tr>
                    <tr>
                      <td><input type=checkbox name=statuslist value=-1><b>Include All</b>
            <%
                           for ( int i = 0; i < statusList.getRecordList().length; i++ )
                           {
                               SiteDefEntityType aType = (SiteDefEntityType) statusList.getRecordList()[i];
            %>
                               <br> <input type=checkbox name=statuslist <% if (aType.getSearchDefault() == 1 ) out.print( " CHECKED " ); %> value=<%=aType.getId()%>><%=aType.getName()%>
                        <% } %>
                      </td>
                    </tr>
                  </table>
              <% } %>
            <% } %>

           <% if ( request.isUserInRole( "CISManager" ) ) { %>
               <p>&nbsp;
                  <table class=row1 width=100% border=1>
                    <tr>
                      <th>
                         <input type=checkbox name=removed> Show only <b><i>Removed</i></b> records
                      </th>
                    </tr>
                  </table>
           <% } %>


