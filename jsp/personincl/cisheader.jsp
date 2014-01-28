
      <% String pageGroupPrefix = "contact"; %>

      <% int personId = -1; %>
      <% if ( request.getParameter( "personId" ) != null ) personId = Integer.parseInt( request.getParameter( "personId" )); %>
      <% if (personId == -2 ) personId = userPerson.getPersonId();  // use logged on user as the person to edit %>

      <% Person person = new Person( dbData, personId ); %>
      <% person.deepPopulate(); %>

      <% if (( personId == -1 ) && (jspUtils.getIntParm( "recordType" ) == Person.RECORDTYPE_BUSINESS_ORG ) ) person.setRecordType( Person.RECORDTYPE_BUSINESS_ORG ); %>
