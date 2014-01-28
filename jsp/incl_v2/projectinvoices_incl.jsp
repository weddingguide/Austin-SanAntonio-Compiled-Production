<%
            InvoiceList invoiceList = new InvoiceList( dbData, aProject.getId(), false ); // all invoices that have a ledger entry for this project
            if ( invoiceList.getRecordList().length > 0 )
            {
%>
               <ul class="compactlist">
<%
               for ( int k = 0; k < invoiceList.getRecordList().length; k++ )
               {
                  Invoice anInvoice = (Invoice) invoiceList.getRecordList()[k];
%>
                  <li><a href=/gl/jsp/user/invoice.jsp?invoiceId=<%=anInvoice.getId()%>><%=anInvoice.getId()%></a>
<%
                  LedgerList aLedgerList = new LedgerList( dbData, anInvoice.getId(), 0, true ); // using taxType = 0 (taxable item)
                  if ( aLedgerList.getRecordList().length > 0 )
                  {
%>
                     <ul class="compactlist">
<%
                     for ( int j = 0; j < aLedgerList.getRecordList().length; j++ )
                     {
                        Ledger ledgerEntry = (Ledger) aLedgerList.getRecordList()[j];
                        Category aCategory = new Category( dbData, ledgerEntry.getCategory() );
%>
                        <li class="compactlistitem" style="margin-left:10px; margin-bottom:0px;"><%=aCategory.getName()%> - <%=ledgerEntry.getDescription()%></li>
<%
                     }
%>
                     </ul>
<%
                  }
               }
%>
               </ul>
<%
            }
%>
