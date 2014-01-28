
        <% InvoiceView invoiceView = (InvoiceView)session.getAttribute( "invoiceView" );
          if (invoiceView == null )
          {
             invoiceView = new InvoiceView( request );
             session.setAttribute( "invoiceView", invoiceView );
          }
          if ( printable ) invoiceView = new InvoiceView( request );
        %>


        <% if ( request.getParameter( "removeLedgerItem" ) != null )
           {
              Ledger ledgerItem = new Ledger( dbData, jspUtils.getIntParm( "invoiceItemId" ) );
              ledgerItem.removeRecord( "LEDGER" );
              self.removeParm( "removeLedgerItem" );
           }
        %>

        <% if (printable )
           {
              invoiceView.ledgerView.showModify = false;
              invoiceView.ledgerView.showRemove = false;
              invoiceView.ledgerView.showMemo = false;
           }

           if (request.getParameter( "omitBalance" ) != null )
           {
              invoiceView.ledgerView.showBalance = false;
           }
        %>


        <% boolean showPayments = false;
           if (request.getParameter( "showPayments" ) != null ) showPayments = true;
        %>
          <% if ((showPropertiesDetails)
                && (invoice.getId() > -1 )) { %>
                <form name="form1a" method="post" action="/gl/jsp/manager/invoiceview/invoiceitementry.jsp">
                  <input type=hidden name=invoiceItemId value="-1" >
                  <%=self.getFormParms()%>
                  <input class="addInvoiceItemButton" name="action" typE="submit" id="action" value="Add Invoice Item">
                </form>
                <div id="clear"></div>
        <% } %>

        <%
           // set up a CategoryTypeList object with the category types that I want in this particular list
           CategoryTypeList selectedCategoryTypes = new CategoryTypeList( dbData, -1); // start with an empty list
           selectedCategoryTypes.add( new CategoryType( dbData, "Client Ledger Entry" ));
           if (showPayments) selectedCategoryTypes.add( new CategoryType( dbData, "Client Payment" ));
           selectedCategoryTypes.add( new CategoryType( dbData, "Sales Tax Charge" ));
           selectedCategoryTypes.add( new CategoryType( dbData, "Shipping & Handling" ));
           selectedCategoryTypes.add( new CategoryType( dbData, "Loan" ));
           if ( request.isUserInRole( "GeneralLedgerOwner" )) selectedCategoryTypes.add( new CategoryType( dbData, "Business Expense" ));

           LedgerList aLedgerList = new LedgerList( dbData, invoice.getId(), selectedCategoryTypes ); // we want all ledger entries except loan-related
           if ( aLedgerList.getRecordList().length > 0 )
           {
        %>


        <% String border = "0";
           if (request.getParameter( "print" ) != null ) border = "1";
        %>

                <table border=<%=border%>>
                 <tr>
                 <% if (invoiceView.ledgerView.showDate) { %>
                   <th align=center>Date</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showProject) { %>
                   <th align=center>Project</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showItem) { %>
                   <th align=center>Item</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showToFrom) { %>
                   <th align=center>Payee</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showQuantity) { %>
                   <th align=center>Quantity</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showUnit) { %>
                   <th align=center>Unit Amount</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showTotal) { %>
                   <th width=10% align=center>Total</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showBalance) { %>
                   <th width=10% align=center>Balance</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showDescription) { %>
                   <th align=center>Description</td>
                 <% } %>
                 <% if (invoiceView.ledgerView.showMemo) { %>
                   <th align=center>Memo</td>
                 <% } %>
                 </tr>

                    <% for ( int i = 0; i < aLedgerList.getRecordList().length; i++ ) { %>
                        <% Ledger ledgerEntry = (Ledger) aLedgerList.getRecordList()[i];

                        String rowClass = "row1";
                        if ( i % 2 != 0 ) rowClass="row0";
                     %>
                        <tr class=<%=rowClass%>>
                           <% Category aCategory = new Category( dbData, ledgerEntry.getCategory() ); %>
                           <% Project aProject = new Project( dbData, ledgerEntry.getProject() ); %>

                           <% if ( aCategory.getDebitCredit() ==  Category.DEBIT )
                              {
                                 total = ledgerEntry.getUnit().multiply( ledgerEntry.getQuantity() );
                                 total = total.setScale( 2, BigDecimal.ROUND_HALF_UP );
                                 balance = balance.add( total );
                              }
                              else
                              {
                                 balance = balance.subtract( ledgerEntry.getUnit().setScale( 2, BigDecimal.ROUND_HALF_UP ) );
                              }
                              //balance = balance.setScale( 2, BigDecimal.ROUND_HALF_UP );

                           %>

                 <% if (invoiceView.ledgerView.showDate) { %>
                              <td>
                                 <%=ledgerEntry.getDate()%>
                              </td>
                 <% } %>


                 <% if (invoiceView.ledgerView.showProject) { %>
                              <td>
                                 <%=aProject.getName()%>
                              </td>
                 <% } %>


                 <% if (invoiceView.ledgerView.showItem) { %>
                              <td>
                                 <%=aCategory.getName()%>
                              </td>
                 <% } %>



                 <% if (invoiceView.ledgerView.showToFrom) { %>
                              <td>
                                 <%=ledgerEntry.getToFrom()%>
                              </td>
                 <% } %>



                 <% if (invoiceView.ledgerView.showQuantity) { %>
                              <td>
                                 <%=ledgerEntry.getQuantity()%>
                              </td>
                 <% } %>



                 <% if (invoiceView.ledgerView.showUnit) { %>
                              <td align=right>
                                 <% if ( aCategory.getDebitCredit() ==  Category.DEBIT )
                                    {
                                       out.print( ledgerEntry.getUnit() );
                                    }
                                    else
                                    {
                                       out.print( "&nbsp;" );
                                    }
                                 %>
                              </td>
                 <% } %>


                 <% if (invoiceView.ledgerView.showTotal) { %>
                              <td align=right>
                                 <% if ( aCategory.getDebitCredit() ==  Category.DEBIT )
                                    {
                                       total = ledgerEntry.getUnit().multiply( ledgerEntry.getQuantity() );
                                       out.print( "<font color=red>$" + total.setScale( 2, BigDecimal.ROUND_HALF_UP ) +"</font>");
                                    }
                                    else
                                    {
                                       out.print( "<font color=green>-$" + ledgerEntry.getUnit().setScale( 2, BigDecimal.ROUND_HALF_UP ) +"</font>");
                                    }
                                 %>
                              </td>
                 <% } %>



                 <% if (invoiceView.ledgerView.showBalance) { %>
                              <td align=right>
                                 <% if ( balance.signum() == -1 ) { %>
                                    <font color=green>
                                 <%} else if ( balance.signum() == 1 ) { %>
                                    <font color=red>
                                 <% } %>

                                 <%=balance%>
                                 </font>
                              </td>
                 <% } %>



                 <% if (invoiceView.ledgerView.showDescription) { %>
                              <td>
                                 <% String description = ledgerEntry.getDescription();
                                    if ( description.equals( "" ) ) description="&nbsp;";
                                 %>

                                 <%=description%>
                              </td>
                 <% } %>



                 <% if (invoiceView.ledgerView.showMemo) { %>
                              <td>
                                 <% String memo = ledgerEntry.getMemo();
                                    if ( memo.equals( "" ) ) memo="&nbsp;";
                                 %>

                                 <%=memo%>
                              </td>
                 <% } %>




                              <td>
                 <% if (invoiceView.ledgerView.showModify) { %>
                                 <a class=normallink href="/gl/jsp/manager/invoiceview/invoiceitementry.jsp?invoiceItemId=<%=ledgerEntry.getId()%>&<%=self.getHRefParms()%>" >Modify</a>
                 <% } %>

                 <% if (invoiceView.ledgerView.showRemove) { %>
                              <br>
                                 <a class=normallink onClick='return(validateRemove())' href="<%=self.getJspName()%>?invoiceItemId=<%=ledgerEntry.getId()%>&removeLedgerItem=true&<%=self.getHRefParms()%>">Remove</a>
                 <% } %>
                              </td>
               </tr>
           <% } %>




                <tr class=row0>
                    <% if (invoiceView.ledgerView.showDate) { %>
                      <td >&nbsp;</td>
                    <% } %>
                    <% if (invoiceView.ledgerView.showProject) { %>
                      <td >&nbsp;</td>
                    <% } %>
                    <% if (invoiceView.ledgerView.showItem) { %>
                      <td >&nbsp;</td>
                    <% } %>
                    <% if (invoiceView.ledgerView.showToFrom) { %>
                      <td >&nbsp;</td>
                    <% } %>
                    <% if (invoiceView.ledgerView.showQuantity) { %>
                      <td >&nbsp;</td>
                    <% } %>
                    <% if (invoiceView.ledgerView.showUnit) { %>
                      <td >&nbsp;</td>
                    <% } %>
                    <% if (invoiceView.ledgerView.showBalance) { %>
                      <td>Balance:</td>
                      <td align=right>
                                 <% if ( balance.signum() == -1 ) { %>
                                    <font color=green>-
                                 <%} else if ( balance.signum() == 1 ) { %>
                                    <font color=red>
                                 <% } %>
                      <%=balance%></td>
                                 </font>
                    <% } %>
                </tr>
             </table>

                    <% if (!invoiceView.ledgerView.showBalance) { %>
                         <h4>Total Charges: $<%=balance%></h4>
                    <% } %>



        <% } else { %>
           <h3>No items exist for this invoice</h3>
        <% } %>


<script>
  function validateRemove()
  {
     if (confirm( 'Remove this item from the invoice?' )) return true;
     return(false);
  }
</script>
