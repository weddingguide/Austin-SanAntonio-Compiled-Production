<%
          String description = invoice.getInvoiceDescription();

          Random random = new Random();
          String sequence = Integer.toString( random.nextInt( 100000 ));


          String loginId = aMerchant.getLoginId();
          String txnKey = aMerchant.getTxnKey();

          String tStamp = Long.toString( (new java.util.Date()).getTime() / 1000 );

          String fingerPrint = loginId + "^" + sequence + "^" + tStamp + "^" + amount + "^";

          SecretKey secretKey = new SecretKeySpec( txnKey.getBytes(), "HmacMD5" );

          Mac mac = Mac.getInstance("HmacMD5");
          mac.init(secretKey);
          byte[] hmac = mac.doFinal( fingerPrint.getBytes() );
          String hmacString="";
          for(int i = 0; i < hmac.length; i++)
          {
             int ch = (new Byte( hmac[i] )).intValue();
             String hex = "00"+Integer.toHexString( ch );
             hmacString += hex.substring( hex.length()-2 );
          }
%>

       <% userPerson.deepPopulate(); // need more info than usual from the logged on user... %>


       <b><% if ( invoice.getPaymentOption() == Invoice.PAYMENTOPTION_PARTIAL ) out.print( "Current " ); %>
       Payment Amount: <%="$"+amount%></b>
<%
       String gatewayUrl = aMerchant.getGatewayUrl();
       if (gatewayUrl.equals("")) gatewayUrl = "https://secure.authorize.net/gateway/transact.dll"; // cover legacy setups that do not have gatewayUrl set in merchant record
%>

      <FORM action="<%=gatewayUrl%>" >
          <input type=hidden name=clientId value='<%= invoice.getClientId()%>' >
          <input type=hidden name=clientType value='<%= invoice.getClientType()%>' >

          <input type=hidden name=invoiceId_payment value=-1 >
          <input type=hidden name=merchant value='<%= invoice.getMerchant()%>' >
          <input type=hidden name=clientId_payment value='<%= invoice.getClientId()%>' >
          <input type=hidden name=clientType_payment value='<%= invoice.getClientType()%>' >
          <input type=hidden name=groupId_payment value=1 >
          <input type=hidden name=category_payment value="<%=aMerchant.getPaymentCategory()%>">
          <input type=hidden name=quantity_payment value=1>
          <input type=hidden id=unit_payment name=unit_payment  value="<%=amount%>">



          <input type="hidden" name="x_description" value="<%=description%>" >
          <input type="hidden" name="x_login" value="<%=aMerchant.getLoginId()%>" >
          <input type="hidden" id=x_amount name="x_amount" value="<%=amount%>">

          <input type="hidden" name="x_first_name" value="<%=userPerson.getFirstName()%>">
          <input type="hidden" name="x_last_name" value="<%=userPerson.getLastName()%>">
          <input type="hidden" name="x_address" value="<%=userPerson.getAddress().getAddressLine1()%>">
          <input type="hidden" name="x_city" value="<%=userPerson.getAddress().getCity()%>">
          <input type="hidden" name="x_state" value="<%=userPerson.getAddress().getState()%>">
          <input type="hidden" name="x_zip" value="<%=userPerson.getAddress().getPostalCode()%>">
          <input type="hidden" name="x_phone" value="<%=userPerson.getPhone().getPhoneNumber()%>">
          <input type="hidden" name="x_email" value="<%=userPerson.getEmail().getEmailAddress()%>">
          <input type="hidden" name="x_email_customer" value="TRUE">
          <input type="hidden" name="x_cust_id" value="<%=userPerson.getPersonId()%>">
          <input type="hidden" name="x_invoice_num" value="<%=invoice.getId()%>">


          <input type="hidden" name="x_fp_sequence" value="<%=sequence%>">
          <input type="hidden" name="x_fp_timestamp" value="<%=tStamp%>">
          <input type="hidden" name="x_fp_hash" value="<%=hmacString%>">

          <!-- input type="hidden" name="x_relay_response" value="TRUE" -->
          <!-- input type="hidden" name="x_relay_url" value="<%=aMerchant.getRelay()%>" -->

          <input type="hidden" name="x_show_form" value="PAYMENT_FORM">

          <% if ( request.isUserInRole( "PaymentOwner" )) { %>
                       <input type=radio name="x_test_request" value="TRUE"> Test-Mode
                       <input checked type=radio name="x_test_request" value="FALSE"> Live-Transaction
          <% } else { %>
             <input type="hidden" name="x_test_request" value="<%=aMerchant.getTestMode()%>">
          <% } %>
