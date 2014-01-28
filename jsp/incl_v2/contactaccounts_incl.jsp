      <h3>Account Statement</h3>
   <form method=get action=<%=self.getJspName()%>>
      <table>
         <tr>
           <th>Date</th>
           <th>Type</th>
           <th>Description</th>
           <th>&nbsp;</th>
           <th>Amount</th>
           <th>Balance</th>
        </tr>

<%
       if (( request.getParameter( "paidbycheck" ) != null ) || ( request.getParameter("paidcash") != null ))
       {
          Ledger ledger = new Ledger( dbData,  -1 );
          ledger.setQuantity( new BigDecimal(1));
          ledger.setUnit( new BigDecimal(request.getParameter(  "cash_check_amount" )));

          if (request.getParameter( "paidbycheck" ) != null )
          {
             ledger.setCategory( 29 ); //!!!!!!!!!!!!!! should not be hardcoded!!!!
             ledger.setMemo( request.getParameter( "checknum" ));
          }
          else ledger.setCategory( 30 ); //!!!!!!!!!!!!!! should not be hardcoded!!!!

          ledger.createOrUpdateRecord( "LEDGER", jspUtils.getIntParm("invoiceId" ));
       }

       if (request.getParameter( "deleteInvoice" ) != null )
       {
          String[] deleteInvoices = request.getParameterValues( "deleteInvoice" );
          for ( int i = 0; i < deleteInvoices.length; i++ )
          {
             Invoice anInvoice = new Invoice( dbData, new Integer( deleteInvoices[i] ).intValue() );
             anInvoice.setStatus( Invoice.STATUS_DELETED );
             anInvoice.updateRecord( "INVOICE" );
          }
        }

        Invoice invoice = new Invoice( dbData, -1 ); // for migration to account statement structure, we still need to be somewhat 'invoice-centric' for
                                                     // payments.  So for the time being, the last invoice found for the client in the loop will be
                                                     // the 'payment' invoice.



        BigDecimal balance = new BigDecimal((long)0);
        String amountStyle = "credit";
        AccountStatement statement = new AccountStatement( dbData, ObjectClassID.CONTACT, aContact.getId(), false ); // 11/27/12 - temp - building from invoices each time until invoice update also updates accountstatements
        for ( int i = 0; i < statement.getStatementItemList().getRecordList().length; i++ )
        {
           StatementItem item = (StatementItem) statement.getStatementItemList().getRecordList()[i];

           String rowClass = "row1";
           if ( i % 2 != 0 ) rowClass="row0";
%>
           <tr class="<%=rowClass%>">
<% if ( request.getParameter( "batch" ) != null )
   {
%>
             <td>
                <input type=checkbox name="deleteInvoice" value=<%=item.getInvoiceId()%>><img src=/images/b_drop.png>
             </td>
<%
   }
%>
             <td>
                <%=item.getDate()%>
             </td>
             <td>
              <b>
<%              if ( item.getItemType() == StatementItem.TYPE_INVOICE )
                {
                   out.print( "Invoice" );
                   balance = balance.add( item.getAmount().setScale( 2, BigDecimal.ROUND_HALF_UP ) );
                }
                else
                {
                   Category aCategory = new Category( dbData, item.getItemType());
                   out.print( aCategory.getName() );
                   balance = balance.subtract( item.getAmount().setScale( 2, BigDecimal.ROUND_HALF_UP )  );
                }
%>
              </b>
             </td>
             <td>
               <%=item.getDescription()%>
             </td>
             <td>
               <%=item.getMemo()%>
<%              if ( item.getItemType() == StatementItem.TYPE_INVOICE )
                {
                   Invoice thisInvoice = new Invoice( dbData, item.getInvoiceId() );
                   if ( thisInvoice.getParentInvoice() == 0 ) invoice = thisInvoice;  // ##### still a hack... but make sure any 'gift card' invoices don't get the payment applied (Stephanie Rainbow 02/03/12)
%>
                   <a class="nonformbutton" href="/gl/jsp/user/invoice.jsp?invoiceId=<%=thisInvoice.getId()%>&clientId=<%=thisInvoice.getClientId()%>&clientType=<%=thisInvoice.getClientType()%>&omitBalance=true&omitPaymentButton=true">View</a>
<%              }
%>
             </td>
             <td style="text-align:right">
<%             amountStyle = "credit";
               if ( item.getItemType() == StatementItem.TYPE_INVOICE ) amountStyle= "debit";
%>
               <span class="<%=amountStyle%>">$<%=item.getAmount()%></span>
             </td>
             <td style="text-align:right">
<%             amountStyle = "";
               if ( balance.signum() == 1 ) amountStyle= "debit";
               if ( balance.signum() == -1 ) amountStyle= "credit";
%>
               <span class="<%=amountStyle%>">$<%=balance%></span>
             </td>
           </tr>
           <tr>
<%     }
%>
         <tr>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td colspan=2>Current Balance:</td>
           <td><b><span class="<%=amountStyle%>">$<%=balance%></span></b></td>
        </tr>
     </table>

         <input type=hidden id=abc name=clientId value=<%=aContact.getId()%>>
         <input type=hidden id=abc name=clientType value=<%=ObjectClassID.CONTACT%>>
         <input type=hidden id=abc name=batch value=true>

           <% if ( request.isUserInRole( "GeneralLedgerManager" ) ) { %>
              <% if ( request.getParameter( "batch" ) != null )
                 {
              %>
                   <input type=submit name=batchdelete value="Remove Selected">
              <% } %>
           <% } %>
     </form>


     <form method=get action=/gl/jsp/user/invoice.jsp>
         <input type=hidden id=abc name=invoiceId value=-1>
         <input type=hidden id=abc name=clientId value=<%=aContact.getId()%>>
         <input type=hidden id=abc name=clientType value=<%=ObjectClassID.CONTACT%>>

           <% if ( request.isUserInRole( "GeneralLedgerManager" ) ) { %>
              <input type=submit name=action value="Add Invoice">
           <% } %>

     </form>


<% Merchant aMerchant = new Merchant( dbData, invoice.getMerchant() );        %>

<%@ include file="amount_v2.jsp" %>

<% // if ( balance.signum() == 1 ) { // only show payment buttons if balance due %>
<% if ( true ) { %>

  <div style="width:300px; float:right; ">
   <fieldset  style="margin-top:10px;">
     <legend>Make Payment</legend>
   <%@ include file="authorizenet_v2.jsp" %>

                 <button type="submit"onClick="return( validateForm(this.form) )">Pay by Credit Card</button>
                 <div style="float:right;">
                    <image src=/images/visa.gif>
                    <image src=/images/mastercard.gif>
                 </div>
     </form>

     <% if ( request.isUserInRole( "PaymentOperator" )) { %>
      <form action=<%=self.getJspName()%> method=post>
           <table>
              <tr>
                <td>
                   <input type="submit" name=paidbycheck value="Record Check Payment">
                </td>
                <td>
                   Check #:<input name=checknum style="width:50px">
                </td>
              </tr>
              <tr>
                <td>
                  <input type="submit" name=paidcash value="Record Cash Payment">
                </td>
              </tr>
            </table>
            <input type="hidden" name=formInstanceId value=<%=formInstanceId%>>
            <input type="hidden" name=invoiceId value=<%=invoice.getId()%>>
            <input type="hidden" name=contactId value=<%=aContact.getId()%>>
            <input type="hidden" name=cash_check_amount value=<%=amount%>>
      </form>
     <% } %>
   </fieldset>
   </div>
   <div id="clear"></div>
 <% } %>
<hr>
