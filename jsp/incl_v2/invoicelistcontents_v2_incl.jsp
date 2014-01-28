  <%  Hashtable projectHash = new Hashtable();

      BigDecimal taxableChargesSum = new BigDecimal((long)0);
      BigDecimal taxSum = new BigDecimal((long)0);
   %>

 <% if ( aInvoiceList.getRecordList().length > 0 )
    {
    %>

         <table id=invoiceList class=sortable <% if (request.getParameter("print") != null ) out.print("border=1"); %>>
             <tr>
               <% if ( invoiceView.showOwner ) { %>
                  <th>Name</th>
               <% } %>
               <% if ( invoiceView.showCreateDate ) { %>
                  <th>Date</th>
               <% } %>
               <% if ( invoiceView.showInvoiceDescription ) { %>
                  <th>Description</th>
               <% } %>
               <% if ( invoiceView.showInvoiceComment ) { %>
                  <th>Comment</th>
               <% } %>
               <% if ( invoiceView.showShipToTextField ) { %>
                  <th>For</th>
               <% } %>
               <% if ( invoiceView.showItemCount ) { %>
                  <th>Quantity</th>
               <% } %>
               <% if ( invoiceView.showTotalCharges ) { %>
                  <th>Charges</th>
               <% } %>
               <% if ( invoiceView.showTotalCredits ) { %>
                  <th>Credits</th>
               <% } %>
               <% if ( invoiceView.showBalance ) { %>
                  <th>Balance</th>
               <% } %>
               <% if ( invoiceView.showTaxableCharges ) { %>
                  <th>Taxable Charges</th>
               <% } %>
               <% if ( invoiceView.showTax ) { %>
                  <th>Tax</th>
               <% } %>
               <% if ( invoiceView.showCloseDate ) { %>
                  <th>Close Date</th>
               <% } %>
               <% if ( invoiceView.showProjectsAndCategories) { %>
                  <th>Project / Item</th>
               <% } %>
               <% if ( invoiceView.showReviewStatus ) { %>
                  <th>Review
                  </th>
               <% } %>
               <% if ( invoiceView.showDeliveryType ) { %>
                  <th>Delivery
                  </th>
               <% } %>
               <% if (invoiceView.showOriginator) { %>
                 <th align=center>Originator</th>
               <% } %>
               <% if (invoiceView.showDueDate) { %>
                 <th align=center>Due Date</th>
               <% } %>
               <% if ( invoiceView.showRecurType ) { %>
                  <th>Recurring Charges</th>
               <% } %>
               <% if ( invoiceView.showReferenceTemplate ) { %>
                  <th>Reference Template</th>
               <% } %>

            </tr>
             <tr>
               <% if ( invoiceView.showOwner ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showCreateDate ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showInvoiceDescription ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showInvoiceComment ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showShipToTextField ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showItemCount ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showTotalCharges ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showTotalCredits ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showBalance ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showTaxableCharges ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showTax ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showCloseDate ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showProjectsAndCategories) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showReviewStatus ) { %>
                  <td><input style="font-size:9pt" type=submit value="Select All" onClick="return(reviewSelectAll( document.form1.reviewstatus ));">
                  </td>
               <% } %>
               <% if ( invoiceView.showDeliveryType ) { %>
                  <td><input style="font-size:9pt" type=submit value="Select All" onClick="return(reviewSelectAll( document.form1.deliverystatus ));">
                  </td>
               <% } %>
               <% if (invoiceView.showOriginator) { %>
                 <th align=center>&nbsp;</td>
               <% } %>
               <% if (invoiceView.showDueDate) { %>
                 <th align=center>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showRecurType ) { %>
                  <td>&nbsp;</td>
               <% } %>
               <% if ( invoiceView.showReferenceTemplate ) { %>
                  <td>&nbsp;</td>
               <% } %>

            </tr>


          <%
             int rowNdx = 0;
             for ( int i = 0; i < aInvoiceList.getRecordList().length; i++ )
                {
                   String rowClass = "row1";
                   if ( rowNdx % 2 != 0 ) rowClass="row0";
             %>
                    <% Invoice aInvoice = (Invoice)aInvoiceList.getRecordList()[i];
                       aInvoice.deepPopulate();
                       aInvoice.verifyAndUpdateBalanceState();

                       if (( request.getParameter("zeroBalance") == null) || (aInvoice.getBalance().compareTo( new BigDecimal((long)0))==0))
                       {
                          rowNdx++;
                    %>
                 <tr class=<%=rowClass%>>


                       <% if ( ( aInvoice.getRecurType() != Invoice.RECUR_TEMPLATE) // if it's a template, only show it if we're also showing recur type
                          || ( invoiceView.showRecurType ) )
                         {
                       %>

                          <% if ( invoiceView.showOwner ) { %>
                             <td>
                                <%= aInvoice.getOwnerName( invoiceView.orderLastFirst )[0] %>
                            </td>
                          <% } %>

                          <% if ( invoiceView.showCreateDate ) { %>
                             <td>
                               <%=aInvoice.getCreateDate()%>
                             </td>
                          <% } %>

                          <% if ( invoiceView.showInvoiceDescription ) { %>
                            <td>
                                <%= aInvoice.getInvoiceDescription() %>
                           </td>
                          <% } %>

                          <% if ( invoiceView.showInvoiceComment ) { %>
                            <td>
                               <%= aInvoice.getInvoiceComment() %>
                            </td>
                          <% } %>

                          <% if ( invoiceView.showShipToTextField ) { %>
                            <td>
                               <%= aInvoice.getShipToTextField() %>
                            </td>
                          <% } %>



                          <% if ( invoiceView.showItemCount ) { %>
                             <td>
                               <%= aInvoice.getLedgerList().getRecordList().length %>
                             </td>
                          <% } %>
                          <% if ( invoiceView.showTotalCharges ) { %>
                             <td align=right>
                                <font class="debit">$<%=aInvoice.getTotalCharges().setScale( 2, BigDecimal.ROUND_HALF_UP )%></font>
                            </td>
                          <% } %>
                          <% if ( invoiceView.showTotalCredits ) { %>
                             <td align=right>
                                <font class="credit">-$<%=aInvoice.getTotalCredits().setScale( 2, BigDecimal.ROUND_HALF_UP )%></font>
                            </td>
                          <% } %>

                          <% if ( invoiceView.showBalance ) { %>
                             <td align=right>
                                <% String amountstyle = "zeroamount";
                                   String prefix = "";
                                   if ( aInvoice.getBalance().compareTo( new BigDecimal((long)0)) == 1 ) amountstyle = "debit";
                                   if ( aInvoice.getBalance().compareTo( new BigDecimal((long)0)) == -1 )
                                   {
                                      amountstyle = "credit";
                                      prefix = "-";
                                   }
                                %>
                                <font class=<%=amountstyle%>>$<%=aInvoice.getBalance().setScale( 2, BigDecimal.ROUND_HALF_UP )%></font>
                            </td>
                          <% } %>

                          <% if ( invoiceView.showTaxableCharges ) {
                             taxableChargesSum = taxableChargesSum.add( aInvoice.getTaxableCharges());
                          %>
                             <td align=right>
                                <font class="debit">-$<%=aInvoice.getTaxableCharges().setScale( 2, BigDecimal.ROUND_HALF_UP )%></font>
                            </td>
                          <% } %>
                          <% if ( invoiceView.showTax ) {
                             taxSum = taxSum.add( aInvoice.getTax());
                          %>
                             <td align=right>
                                <font class="debit">-$<%=aInvoice.getTax().setScale( 2, BigDecimal.ROUND_HALF_UP )%></font>
                            </td>
                          <% } %>
                          <% if ( invoiceView.showCloseDate ) { %>
                             <td><%=aInvoice.getCloseDate()%></td>
                          <% } %>

                          <% if (invoiceView.showDueDate) { %>
                                       <td>
                                          <% String dueDate = aInvoice.getDueDate().toString();
                                             if ( dueDate.equals( "1970-01-01" ) ) dueDate="--";
                                             if ( dueDate.equals( "1969-12-31" ) ) dueDate="--";
                                          %>

                                          <%=dueDate%>
                                       </td>
                          <% } %>


                          <% if ( invoiceView.showRecurType ) { %>
                             <td><%=Invoice.recurText[aInvoice.getRecurType()]%></td>
                          <% } %>

                          <% if ( invoiceView.showReferenceTemplate ) { %>
                             <td><%=aInvoice.getReferenceTemplate()%></td>
                          <% } %>


                          <% if ( invoiceView.showProjectsAndCategories ) { %>
                            <td>
                               <table border=1>
                               <%  for (int j=0; j<aInvoice.getLedgerList().getRecordList().length; j++ )
                                   {
                                      Ledger ledger = (Ledger)aInvoice.getLedgerList().getRecordList()[j];

                                      Project itemProject = (Project)(aInvoice.getProjectHash().get( new Integer(ledger.getProject())) );
                                      Category itemCategory = (Category)(aInvoice.getCategoryHash().get( new Integer(ledger.getCategory())) );
                                      CategoryType itemCategoryType = (CategoryType)(aInvoice.getCategoryTypeHash().get( new Integer(itemCategory.getType() )));
                               %>
                             <%

                                      if ( itemCategoryType.getType() ==1 ) // shouldn't hardcode... but for now this type is ledger entry
                                      {
                                         out.print("<tr class="+rowClass+"><td width=50% >");
                                         out.print(itemProject.getName());
                                         out.print("</td><td>");
                                         out.print( ledger.getQuantity() + " - " + itemCategory.getName());
                                         out.print("</td></tr>");
                              %>
                              <%
                                         // need to fix this to use summary counts from invoiceList (but it's not finished...)

                                         Hashtable categoryHash = (Hashtable) projectHash.get( new Integer(ledger.getProject() ));
                                         if (categoryHash == null)
                                         {
                                            categoryHash = new Hashtable();
                                            projectHash.put( new Integer(ledger.getProject()), categoryHash );
                                         }
                             %>
                             <%
                                         if ( categoryHash.get( new Integer( ledger.getCategory() ) )== null )
                                         {
                                             categoryHash.put( new Integer( ledger.getCategory()), new Integer(0) );
                                         }
                                         int catCount = ((Integer)categoryHash.get( new Integer( ledger.getCategory() ) )).intValue();
                                         categoryHash.put( new Integer( ledger.getCategory()), new Integer( catCount + ledger.getQuantity().intValue()) );
                                      }
                                   }
                                %>
                                </table>
                             </td>
                          <% } %>

                          <input type=hidden id=listedInvoice name=listedInvoice value=<%=aInvoice.getId()%>>

                          <% if ( invoiceView.showReviewStatus ) { %>
                            <td align=center>
                               <%
                                      if (aInvoice.getReviewStatus() == 1 ) out.print( "<font class=\"credit\"><input type=checkbox checked id=reviewstatus name=reviewstatus value="+aInvoice.getId() + " ></font>" );
                                      if (aInvoice.getReviewStatus() == 0 ) out.print( "<font class=\"debit\"><input type=checkbox id=reviewstatus name=reviewstatus value="+aInvoice.getId() + " ></font>" );
                               %>
                            </td>
                          <% } %>

                          <% if ( invoiceView.showDeliveryType ) { %>
                             <td>
                                <%
                                   if (aInvoice.getDeliveryType() != Invoice.NO_DELIVERY_REQUIRED )
                                   {
                                      if (aInvoice.getDeliveryStatus() == Invoice.DELIVERY_STATUS_DELIVERED ) out.print( "<font class=\"credit\"><input id=deliverystatus name=deliverystatus value="+aInvoice.getId() + " type=checkbox checked></font>" );
                                      if (aInvoice.getDeliveryStatus() == Invoice.DELIVERY_STATUS_NOT_DELIVERED ) out.print( "<font class=\"debit\"><input id=deliverystatus name=deliverystatus value="+aInvoice.getId() + " type=checkbox></font>" );
                                   }

                                   if (aInvoice.getDeliveryType() == Invoice.DELIVER_BY_MAIL )
                                   {
                                      out.print( "Mail");
                                   }
                                   else
                                   {
                                      if (aInvoice.getDeliveryType() == Invoice.DELIVER_IN_PERSON )
                                      {
                                         out.print( "In person");
                                      }
                                      else
                                      {
                                         if (aInvoice.getDeliveryType() == Invoice.NO_DELIVERY_REQUIRED )
                                         {
                                            out.print( "No delivery required");
                                         }
                                         else
                                         {
                                            out.print( "Unknown");
                                         }
                                      }
                                   }
                                %>
                            </td>
                          <% } %>


                          <% if ( invoiceView.showOriginator ) { %>
                            <td><%= aInvoice.getOriginator()%></td>
                          <% } %>



                          <td>
                             <% if ( invoiceView.showOpen ) { %>
                                <a target=window2 class="nonformbutton" href="/gl/jsp/user/invoice.jsp?invoiceId=<%=aInvoice.getId()%>&clientId=<%=aInvoice.getClientId()%>&clientType=<%=aInvoice.getClientType()%>">Open</a>
                             <% } %>
                             <% if ( invoiceView.showRemove ) { %>
                                <br><a class=normallink href="?formInstanceId=<%=formInstanceId%>&invoiceId=<%=aInvoice.getId()%>&projectId=<%=request.getParameter("projectId")%>&clientId=<%=request.getParameter("clientId")%>&removeInvoice=true onClick='return(validateRemove());'" >Remove</a>
                             <% } %>
                          </td>
                    </tr>
                    <% } %>
                 <% } %>
             <% } %>
         </table>
 <% } else { %>
    <h3>No invoices found</h3>
 <% } %>

<script>
  function validateRemove()
  {
     if (confirm( 'Remove this invoice?' )) return true;
     return(false);
  }
</script>

