
        <%
           if ( pages > 1 )
           {
        %>

                <p>Displaying records: <%=firstEntry+1%> - <%=firstEntry+entriesPerPage%>
                <p style="font-size:9pt">Go to page:

        <%
                int currentPage = (firstEntry / entriesPerPage );

                if ( currentPage > 0 )
                {
        %>
                   <a href=<%=self.getJspName()%>?firstEntry=<%=(currentPage-1)*entriesPerPage%>&entriesperpage=<%=entriesPerPage%><%=listHandler.getFormURLExtension()%>>Prev</a> -
        <%
                }

                for ( int thePage = 0; thePage < pages; thePage++ )
                {
                   if ( thePage != currentPage )
                   {
        %>
                      <a href=<%=self.getJspName()%>?firstEntry=<%=(thePage)*entriesPerPage%>&entriesperpage=<%=entriesPerPage%><%=listHandler.getFormURLExtension()%>><%=thePage+1%></a> -
        <%
                   }
                   else
                   {
        %>
                      <font color=red><b> <%=thePage+1%> </b></font> -
        <%
                   }
                }
                if ( currentPage < pages-1 )
                {
        %>
                   <a href=<%=self.getJspName()%>?firstEntry=<%=(currentPage+1)*entriesPerPage%>&entriesperpage=<%=entriesPerPage%><%=listHandler.getFormURLExtension()%>>Next</a>
        <%
                }
           }
        %>
