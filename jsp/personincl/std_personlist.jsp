<script>
  function validateRemove()
  {
     if (confirm( 'Remove this entry?' )) return true;
     return(false);
  }
</script>

         <%
            int totalRecordCount=0;
            int entriesPerPage = jspUtils.getIntParm( "entriesperpage" );
            if (entriesPerPage < 1) entriesPerPage = 30;
            int firstEntry=0;

            int recordType = Person.RECORDTYPE_PERSON;
            if ( request.getParameter( "business" ) != null ) recordType = Person.RECORDTYPE_BUSINESS_ORG;


            SiteDefEntityTypeList statusList = new SiteDefEntityTypeList( dbData, recordType );
            String statusText[]  = null;
            if ( statusList.getRecordList().length > 0 )
            {
               statusText = new String[ statusList.getRecordList().length + 1 ];
               statusText[0] = "<unknown>";
            }

            for ( int i = 0; i < statusList.getRecordList().length; i++ )
            {
                SiteDefEntityType aType = (SiteDefEntityType) statusList.getRecordList()[i];
                statusText[ aType.getId() ] = aType.getName();
            }
         %>

        <% PersonList aPersonList;

           if (
                (
                   ( !request.isUserInRole( "CISOperator" ))
                  &&(!request.isUserInRole( "CISViewer"    ))
                )        // this is user-level... only show user's asso businesses
                ||( jspUtils.getIntParm( "personId") == -2 )        // if operator auth, still need a way to force 'mine only'
              )
           {
              aPersonList = new PersonList( dbData, userPerson.getPersonId(), true, true );
           }
           else if ( request.getParameter( "refreshquery" ) != null )
           {
              String  currQuery = (String) session.getAttribute( "queryString" );
              if ( currQuery != null ) aPersonList = new PersonList( dbData, currQuery, true );
              else aPersonList = new PersonList( dbData, personId );
           }
           else if ( request.getParameter( "SavedSearch" ) != null )
           {
              SavedQuery savedQuery = new SavedQuery( dbData, request.getParameter( "savedquery")  );
              aPersonList = new PersonList( dbData );
              aPersonList.setQueryString( savedQuery.getQueryString() );
              session.setAttribute( "queryString", savedQuery.getQueryString() );

              aPersonList.doQuery( 0, entriesPerPage );
              firstEntry = 0;
           }
           else if ( request.getParameter( "GroupList" ) != null )
           {
              aPersonList = new PersonList( dbData, EntityGroup.TYPE_GENERAL, jspUtils.getIntParm( "groupNum" ), recordType, request, false ); // just set up query... this constructor will not execute it
              String queryString = aPersonList.getQueryString();
              session.setAttribute( "queryString", queryString );

              aPersonList.doQuery( 0, entriesPerPage );
              firstEntry = 0;
           }

           else if ( request.getParameter( "firstEntry" ) != null )  // user selected a new page of entries
           {
              aPersonList = new PersonList( dbData );
              firstEntry = jspUtils.getIntParm( "firstEntry" );
              String  currQuery = (String) session.getAttribute( "queryString" );
              aPersonList.setQueryString( currQuery );
              aPersonList.doQuery( firstEntry, entriesPerPage );
           }

           else
           {
              int status = Person.STATUS_ACTIVE;
              if (request.getParameter( "removed") != null ) status = Person.STATUS_REMOVED;
              dbData.getLog().logEvent( "status: " + status );

              aPersonList = new PersonList( dbData, request, pageGroupPrefix, -1, -1, -1, recordType, false, status );  // just set up query... this constructor will not execute it
              String queryString = aPersonList.getQueryString();
              session.setAttribute( "queryString", queryString );

              aPersonList.doQuery( 0, entriesPerPage );
              firstEntry = 0;
           }

           totalRecordCount = aPersonList.getTotalRecordCount();
           int pages = (totalRecordCount / entriesPerPage) + 1;
        %>
           <h3><%=totalRecordCount%> records found</h3>
       <%
           if ( pages > 1 )
           {
       %>
                <p>Displaying records: <%=firstEntry+1%> - <%=firstEntry+entriesPerPage%>
                <p style="font-size:9pt">Go to page:
             <%
                for ( int thePage = 0; thePage < pages; thePage++ )
                {
             %>
                   <a href=<%=self.getJspName()%>?firstEntry=<%=(thePage)*entriesPerPage%>&entriesPerPage=<%=entriesPerPage%><% if (recordType==Person.RECORDTYPE_BUSINESS_ORG) out.print( "&business=*"); %>><%=thePage+1%></a> -
             <%
                }
           }



           session.setAttribute( "personListQueryResults", aPersonList ); // store for use in printing labels JWM 9/23/06

           if ( aPersonList.getRecordList().length > 0 )
           {
               if (request.getParameter( "csv" ) == null )
               {
           %>
              <form class="wideform" method=post action="/maillist/jsp/operator/mailFromTempGroup.jsp">
                <table id='personlist_table' class='sortable' border=0>
                    <tr>
        <% if ( request.isUserInRole( "CISOperator" )) { %>
                           <th>&nbsp;</th>
                           <% if ( statusList.getRecordList().length > 0 ) { %>
                                 <th>Classification</th>
                           <%  } %>
        <% } %>
                           <th>Name</th>
                           <th><%=customText.text [recordType]  [EntityCustomText.OBJECTTYPE_ADDRESS]  [0]  [EntityCustomText.TEXTTYPE_LONG]%></th>
                           <th>Phone</th>
                           <th>Email Address</th>
                           <th>&nbsp;</th>
                    </tr>
           <% } else { %>
                <br>"LastName", "FirstName", "AddrLine1", "AddrLine2", "City", "State", "Zip", "Phone1", "Phone2", "Phone3", "Email1", "Email2", "Email3"
           <% } %>
                    <% for ( int i = 0; i < aPersonList.getRecordList().length; i++ )
                    {
                       if (request.getParameter( "csv" ) == null )
                       {
                    %>
                          <%@ include file="std_personlist_row.jsp" %>
                    <%
                       }
                       else
                       {
                    %>
                          <%@ include file="std_personlist_row_CSV.jsp" %>
                    <%
                       }
                    }

               if (request.getParameter( "csv" ) == null )
               {
           %>
            <% if ( request.isUserInRole( "MailListOperator" )) { %>
                <tr>
                  <td colspan=6>
                    <img name=arrow id=arrow src="../../images/arrow_ltr.gif"><input type=submit name=personselect id=personselect value="Send Email to Selected Names">
                  </td>
                </tr>
            <% } %>

              </table>
             </form>
          <% } %>
            <% } else { %>
               <h3>No matches found for the search request</h3>
            <% } %>


      <% if (( request.isUserInRole( "CISOperator" ))
            ||( request.isUserInRole( "CISViewer" )) )
      { %>

              <% if ( request.getParameter( "business" ) == null ) { %>

                 <% if ( request.isUserInRole( "CISOperator" )) { %>
                     <form name="form1" method="post" action="<%=pageGroupPrefix%>entry.jsp">
                       <input type=hidden name=personId value="-1" >
                       <input name="cisaction" type="submit" id="cisaction" value="Add <%=entityType%>">
                     </form>
                 <% } %>

              <% } else { %>

                 <% if ( request.isUserInRole( "CISOperator" )) { %>
                     <form name="form1" method="post" action="businessentry.jsp">
                       <input type=hidden name=businessEGId value="-1" >
                       <input name="cisaction" type="submit" id="cisaction" value="Add Business">
                     </form>
                 <% } %>

              <% } %>

                     <% String formAction = pageGroupPrefix + "search.jsp";
                        if ( request.getParameter( "business" ) != null ) formAction = "businesssearch.jsp";
                     %>
                     <form name="form2" method="post" action=<%=formAction%>>
                       <input name="search" type="hidden" value="true">
                     <%   if ( request.getParameter( "business" ) != null ) { %>
                       <input type=hidden name=business value=true>
                     <% } %>


                       <input name="cisaction" type="submit" id="cisaction" value="New Search">
                     </form>


                 <% formAction = pageGroupPrefix + "list.jsp";
                    if ( request.getParameter( "business" ) != null ) formAction = "businesslist.jsp";
                 %>

                 <% if ( request.isUserInRole( "CISOperator" )) { %>
                     <form name="form3" method="post" action="<%=formAction%>">
                       <input type=hidden name=formInstanceId value='<%= formInstanceId %>' >
                       <input type=hidden name=refreshquery value=true >
                       <font class=prompt>Save Query As:</font> <input name="queryname" type="text">
                       <input name="cisaction" type="submit" id="cisaction" value="Save This Query">

                       <%   if ( request.getParameter( "business" ) != null ) { %>
                         <input type=hidden name=business value=true>
                       <% } %>

                     </form>
        <% } %>
   <% } %>
