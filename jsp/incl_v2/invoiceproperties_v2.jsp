
   <form action="/invoice" method=post>
&nbsp;
      <% self.removeParm( "invoiceComment" ); %>

      <div class="invoicebillto">
         <div class="prompt1">Bill To:</div>
         <br/>
         <div class"data"><%=invoice.getOwnerAddressBlock()%></div>
      </div>

      <div class="invoicedatenumber">
         <div class="invoicedate">
            <div class="prompt1">Date:</div>
             <div class"data">
                <% if (showPropertiesDetails) { %>
                                <% Calendar cal = Calendar.getInstance(); %>
                                <% cal.setTime( invoice.getCreateDate() ); %>
                                <% int theYear = cal.get( Calendar.YEAR );  %>
                                <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                                <% int theDay = cal.get( Calendar.DATE );  %>
                                <% String datePrefix = "createDate"; %>
                                <% String dateSuffix = ""; %>
                                <% String setDaysFn = "setDaysSingle"; %>
                                <% int theMinute = 0; %>
                                <% int theAMPM = 0; %>
                                <% int numDays; %>
                                <%@ include file="../datetimeincl/dateincl.jsp" %>
                <% } else { %>
                                <%=invoice.getCreateDate()%>
                <% } %>
             </div>
         </div>

         <div class="invoicenumber">

            <div class="prompt1">Invoice #:</div>
            <div class"data"><%=invoice.getId()%></div>
         </div>
      </div>

      <div id="clear"></div>

      <div class="invoiceinfo">
        <div class="datarow">
            <div class="prompt2">Description:</div>
            <div class="data2">
                <% if (showPropertiesDetails) { %>
                          <input type=text name='invoiceDescription' value='<%= invoice.getInvoiceDescription() %>' size=40 maxchars=100>
                <% } else { %>
                          <%=invoice.getInvoiceDescription()%>
                <% } %>

                <% if ( invoice.getShipToRequired() == Invoice.SHIPTO_REQUIRED_TEXTONLY )
                   {
                %>
                   <br><%=invoice.getShipToPrompt()%> <%=invoice.getShipToTextField()%></br>
                <% } %>
            </div>
       </div>
         <div class="datarow">
           <div class="prompt2">Invoice Comment:</div>
           <div class="data2">
                    <% if ( (showPropertiesDetails)
                          || (request.isUserInRole( "OrderOperator" ) ) )
                       {
                    %>
                              <%
                                  if ((!printable )
                                     &&(request.isUserInRole( "OrderOperator" ) ) )
                                  {
                              %>
                                     <input type=text name='invoiceComment' id='comment' value='<%= invoice.getInvoiceComment() %>' size=40 maxchars=40>
                              <%  }
                                  else
                                  {
                              %>
                                     <%= invoice.getInvoiceComment() %>
                              <%  }
                              %>
                    <%    }
                          else
                          {
                    %>
                           <%=invoice.getInvoiceComment()%>
                    <%    } %>
           </div>
         </div>

          <%    if ((request.isUserInRole( "OrderOperator" ) )
                   &&( !printable ))
                {
          %>
           <div class="datarow">
                   <div class="prompt2">Merchant:</div>
                   <div class="data2">
                       <select id=merchant name=merchant>
                       <% MerchantList merchantList = new MerchantList( dbData );
                          for (int i= 0; i < merchantList.getRecordList().length; i++ )
                          {
                             Merchant merchant = (Merchant) merchantList.getRecordList()[i];
                       %>
                             <option <% if (merchant.getId() == invoice.getMerchant() ) out.print( " SELECTED " ); %> value=<%=merchant.getId()%>><%=merchant.getName()%></option>
                       <% } %>
                       </select>
                  </div>
          </div>
          <%    } %>

          <%    if (showPropertiesDetails)
                {
          %>
                <div class="datarow">
                   <div class="prompt2">Status:</div>
                   <div class="data2">
                          <input type=radio name='status' id='status' value=<%=Invoice.STATUS_ACTIVE%> <% if ( invoice.getStatus() <= Invoice.STATUS_ACTIVE ) out.print( " CHECKED " ); %>>Active
                          <br><input type=radio name='status' id='status' value=<%=Invoice.STATUS_CLOSED%> <% if ( invoice.getStatus() == Invoice.STATUS_CLOSED ) out.print( " CHECKED " ); %>>Closed
                          <br><input type=radio name='status' id='status' value=<%=Invoice.STATUS_ABANDONED%> <% if ( invoice.getStatus() == Invoice.STATUS_ABANDONED ) out.print( " CHECKED " ); %>>Abandoned
                   </div>
                </div>
                <div class="datarow">
                   <div class="prompt2">Close Date:</div>
                   <div class="data2">
                       <% { %>
                             <% Calendar cal = Calendar.getInstance(); %>
                             <% cal.setTime( invoice.getCloseDate() ); %>
                             <% int theYear = cal.get( Calendar.YEAR );  %>
                             <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                             <% int theDay = cal.get( Calendar.DATE );  %>
                             <% String datePrefix = "closeDate"; %>
                             <% String dateSuffix = ""; %>
                             <% String setDaysFn = "setDaysSingle"; %>
                             <% int theMinute = 0; %>
                             <% int theAMPM = 0; %>
                             <% int numDays; %>
                             <%@ include file="../datetimeincl/dateincl.jsp" %>
                      <%  } %>
                   </div>
                </div>

                <div class="datarow">
                    <div class="prompt2">Delivery type:</div>
                    <div class="data2">
                          <input type=radio name='deliveryType' id='deliveryType' value='1' <% if ( invoice.getDeliveryType() <= 1 ) out.print( " CHECKED " ); %>>Deliver by mail
                          <br><input type=radio name='deliveryType' id='deliveryType' value='2' <% if ( invoice.getDeliveryType() == 2 ) out.print( " CHECKED " ); %>>Deliver in person
                          <br><input type=radio name='deliveryType' id='deliveryType' value='3' <% if ( invoice.getDeliveryType() == 3 ) out.print( " CHECKED " ); %>>No delivery required
                    </div>
                </div>


                <div class="datarow">
                    <div class="prompt2">Delivery Status:</div>
                    <div class="data2">
                        <input type=checkbox name='deliveryStatus' id='deliveryStatus' value='true'<% if ( invoice.getDeliveryStatus() == 1 ) out.print( " CHECKED " ); %>>Delivered
                    </div>
                </div>

                <div class="datarow">
                    <div class="prompt2">Payment Option:</div>
                    <div class="data2">
                       <input type=checkbox name='paymentOption' id='paymentOption' value='true'<% if ( invoice.getPaymentOption() == 1 ) out.print( " CHECKED " ); %>>Partial Payment Allowed
                    </div>
                </div>

                <div class="datarow">
                    <div class="prompt2">Review Status:</div>
                    <div class="data2">
                       <input type=checkbox name='reviewStatus' id='reviewStatus' value='true'<% if ( invoice.getReviewStatus() == 1 ) out.print( " CHECKED " ); %>>Reviewed
                    </div>
                </div>

                <div class="datarow">
                    <div class="prompt2">Recur Type:</div>
                    <div class="data2">
                              <input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_NO%>' <% if ( invoice.getRecurType() == Invoice.RECUR_NO ) out.print( " CHECKED " ); %>>Non-recurring
                          <br><input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_TEMPLATE%>' <% if ( invoice.getRecurType() == Invoice.RECUR_TEMPLATE ) out.print( " CHECKED " ); %>>Recur Template
                          <br><input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_DAILY%>' <% if ( invoice.getRecurType() == Invoice.RECUR_DAILY ) out.print( " CHECKED " ); %>>Recur Daily
                          <br><input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_WEEKLY%>' <% if ( invoice.getRecurType() == Invoice.RECUR_WEEKLY ) out.print( " CHECKED " ); %>>Recur Weekly
                          <br><input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_MONTHLY%>' <% if ( invoice.getRecurType() == Invoice.RECUR_MONTHLY) out.print( " CHECKED " ); %>>Recur Monthly
                          <br><input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_BIANNUALLY%>' <% if ( invoice.getRecurType() == Invoice.RECUR_BIANNUALLY) out.print( " CHECKED " ); %>>Recur Bi-Annually
                          <br><input type=radio name='recurType' id='recurType' value='<%=Invoice.RECUR_ANNUALLY%>' <% if ( invoice.getRecurType() == Invoice.RECUR_ANNUALLY) out.print( " CHECKED " ); %>>Recur Annually
                    </div>
                </div>

                <div class="datarow">
                    <div class="prompt2">First recurring date:</div>
                    <div class="data2">
                       <% { %>

                             <% Calendar cal = Calendar.getInstance(); %>
                             <% cal.setTime( invoice.getRecurBegin() ); %>
                             <% int theYear = cal.get( Calendar.YEAR );  %>
                             <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                             <% int theDay = cal.get( Calendar.DATE );  %>
                             <% String datePrefix = "recurBegin"; %>
                             <% String dateSuffix = ""; %>
                             <% String setDaysFn = "setDaysSingle"; %>
                             <% int theMinute = 0; %>
                             <% int theAMPM = 0; %>
                             <% int numDays; %>
                             <%@ include file="../datetimeincl/dateincl.jsp" %>
                       <% } %>
                    </div>
                </div>

                <div class="datarow">
                    <div class="prompt2">Reference Template:</div>
                    <div class="data2">
                        <input name=referenceTemplate id=abc value='<%=invoice.getReferenceTemplate()%>'>
                    </div>
                </div>

           <%   } %>

             <% if (showPropertiesDetails)
                {
             %>
                <div class="datarow">
                    <div class="prompt2">&nbsp;</div>
                    <div class="data2">
           <%
                              String buttonText = "Submit Changes";
                              if (!invoice.isRecordFound() ) buttonText= "Create";
           %>
                           <input type=submit name=updateInvoiceProperties value='<%=buttonText%>'>
                   </div>
               </div>
             <% } %>
             <input type=hidden name=dueDate value=<%=invoice.getDueDate()%>>
             <input type=hidden name=dueDate value=<%=invoice.getHasBalanceDue()%>>
             <input type=hidden name=dueDate value=<%=invoice.getDaysDelinquent()%>>
             <input type=hidden name=invoiceId value=<%=request.getParameter( "invoiceId" ) %>>
             <input type=hidden name=clientType value=<%=request.getParameter( "clientType" ) %>>
             <input type=hidden name=clientId value=<%=request.getParameter( "clientId" ) %>>
             <input type=hidden name=formInstanceId value='<%= formInstanceId %>' >

      </div>

   </form>
