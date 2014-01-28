  <%

          balance = balance.setScale( 2, BigDecimal.ROUND_HALF_UP);
          String amount = request.getParameter( "amount" );
          if ( amount == null )
          {
             if ( invoice.getPaymentOption() == Invoice.PAYMENTOPTION_PARTIAL ) amount = "0.00";
             else amount = balance.toString();
          }
          if ( amount.startsWith( "$" )) amount = amount.substring( 1 );

          if ( invoice.getPaymentOption() == Invoice.PAYMENTOPTION_PARTIAL )
          {
  %>
           <form action=<%=self.getJspName()%>>
              <h4>Enter payment amount: <input id=amount size=6 name=amount value="<%=amount%>">
              <input type=hidden name=minPayment value=<%= invoice.getMinInitialPayment().subtract( invoice.getTotalCredits() )%>>
              <% if (invoice.getMinInitialPayment().compareTo( invoice.getTotalCredits() ) == 1 ) { %>
                  <font size=-1><i>(minimum payment: $<%= invoice.getMinInitialPayment().toString()%>)</i></font>
              <% } %>
              </h4>


              <input type=hidden name=clientId value='<%= request.getParameter("clientId")%>' >
              <input type=hidden name=clientType value='<%= request.getParameter("clientType")%>' >
              <input type=hidden name=invoiceId value='<%= request.getParameter("invoiceId")%>' >
              <input type=hidden name="contactId" value=<%=aContact.getId()%>>
              <input type=submit onClick="return( validateAmount('<%=balance.toString()%>', this.form) );" value="Update Payment Amount">
           </form>

           <script>
             function validateForm(form)
             {
                    if (   form.unit_payment.value == "0.00" )
                    {
                       alert( "Payment amount of $0.00 is not allowed." );
                       return(false);
                    }
                    if ( form.amount.value - form.minPayment.value < 0)
                    {
                       alert( "The minimum payment amount is $" + form.minPayment.value );
                       return(false);
                    }
                    return(true);
             }

             function validateAmount(balance, form)
             {
                    if (   form.amount.value == "0.00" )
                    {
                       alert( "Payment amount of $0.00 is not allowed." );
                       return(false);
                    }
                    if ( form.amount.value - form.minPayment.value < 0)
                    {
                       alert( "The minimum payment amount is $" + form.minPayment.value );
                       return(false);
                    }

                    if ( form.amount.value.indexOf( ".") == -1 )
                    {
                       form.amount.value = form.amount.value + ".00";
                    }
                    return(true);
             }
           </script>

       <% } %>
