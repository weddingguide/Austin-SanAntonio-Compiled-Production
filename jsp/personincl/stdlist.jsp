<script>
  function validateRemove()
  {
     if (confirm( 'Remove this entry?' )) return true;
     return(false);
  }
</script>

         <%
            listHandler.init( dbData, request );

            int totalRecordCount=0;
            String  currQuery = null;
            int entriesPerPage = jspUtils.getIntParm( "entriesperpage" );
            if (entriesPerPage < 1) entriesPerPage = 30;
            int firstEntry = 0;

            if ( request.getParameter( "refreshQuery" ) != null )  // bug if any of these three parms aren't valid
            {
               entriesPerPage = ((Integer) session.getAttribute( "entriesPerPage" )).intValue();
               firstEntry = ((Integer) session.getAttribute( "firstEntry" )).intValue();
               currQuery = (String) session.getAttribute( "queryString" );
               listHandler.setQueryString( currQuery );
            }
            else
            {
               if ( request.getParameter( "firstEntry" ) != null )
               {
                  firstEntry = jspUtils.getIntParm( "firstEntry" );
                  if ( firstEntry < 1 ) firstEntry = 0;

                  currQuery = (String) session.getAttribute( "queryString" );
               }

               if ( currQuery == null )
               {
                  currQuery = listHandler.getQueryString(); // need to start a new query
                  session.setAttribute( "queryString", currQuery );
               }
               else
               {
                   listHandler.setQueryString( currQuery );
               }

               session.setAttribute( "firstEntry", new Integer( firstEntry ) );  // need to make sure these are set for the next time around
               session.setAttribute( "entriesPerPage", new Integer( entriesPerPage ) );
            }

            DBRecordList recordList = listHandler.doQuery(firstEntry, entriesPerPage);

            totalRecordCount = listHandler.getTotalRecordCount();
            int pages = (totalRecordCount / entriesPerPage) + 1;
        %>

           <h3><%=totalRecordCount%> records found</h3>
           <%@ include file="pagelinks.jsp" %>

        <%
           session.setAttribute( "personListQueryResults", recordList ); // store for use in printing labels JWM 9/23/06
           if ( recordList.getRecordList().length > 0 )
           {
        %>
                     <form class="wideform" method=post action="/maillist/jsp/operator/mailFromTempGroup.jsp">
                       <table id='recordListTable' class='sortable listbackground' border=0>
                           <tr>
                              <%=listHandler.getTableHeaderString()%>
                           </tr>
        <%
                        for ( int i = 0; i < recordList.getRecordList().length; i++ )
                        {
                           String rowClass = "row1";
                           if ( i % 2 != 0 ) rowClass="row0";
        %>
                           <tr class=<%=rowClass%>>
                              <%=listHandler.getTableRowString( i )%>
                           </tr>
        <%
                        }
        %>
                     </table>
                              <%=listHandler.getLastRowString()%>
                    </form>
        <%@ include file="pagelinks.jsp" %>
       <% } else { %>
               <h3>No matches found for the search request</h3>
       <% } %>

       <%=listHandler.getActionButtonString()%>
