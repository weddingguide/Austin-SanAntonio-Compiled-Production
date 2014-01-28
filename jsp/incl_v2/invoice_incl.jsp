   <div class="narrowContainer">
   <%

           if ( request.getParameter( "addmodify" ) != null )
           {
             if ( request.getParameter( "addmodify" ).equals( "Submit" ) )
             {
                int invoiceItemId = jspUtils.getIntParm(( "invoiceItemId" ) );
                Ledger ledger = new Ledger( dbData,  invoiceItemId );                                             //load from db
                ledger.populateObject( request, "" );                                                             //update from form

                // need to see if a new froject also needs to be created...
                if ( request.getParameter( "createNewProject" ) != null )
                {
                   Project aProject = new Project( dbData, -1 );
                   aProject.setName( request.getParameter( "name" ));
                   aProject.setType( jspUtils.getIntParm( "type" ));
                   aProject.setStatus( jspUtils.getIntParm( "status" ));
                   aProject.createOrUpdateRecord( "PROJECT" );
                   ledger.setProject( aProject.getId() );
                }

                ledger.createOrUpdateRecord( "LEDGER", invoiceId );
                self.removeParm( "addmodify" );
             }
           }

           if ( request.getParameter( "updateInvoiceProperties" ) != null )
           {
                invoice.populateObject( request, "" );                                                             //update from form
                invoice.createOrUpdateRecord( "INVOICE" );
                invoiceId = invoice.getId();
                self.update( "invoiceId", invoiceId );
                self.removeParm( "updateInvoiceProperties" );
           }
   %>

           <% boolean managerRole = request.isUserInRole( "GeneralLedgerManager" ); %>
           <% boolean showPropertiesDetails = managerRole;
              if ( printable ) showPropertiesDetails = false;
           %>


           <%@ include file="invoiceproperties_v2.jsp" %>


   </div>

   <% BigDecimal balance = new BigDecimal((long)0); %>
   <% BigDecimal total = new BigDecimal((long)0); %>

   <% if ( invoice.getId() > -1 ) { %>
   <div class="mediumWidthContainer">
       <div class="invoiceledger">
           <%@ include file="invoicecontents_v2.jsp" %>
        </div>
   </div>
   <% } %>
</div>
