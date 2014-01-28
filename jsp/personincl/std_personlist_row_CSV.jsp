                           <% Person aPerson = (Person)aPersonList.getRecordList()[i]; %>
                               <br>
                               "<%= aPerson.getLastName() %>",
                               "<%= aPerson.getFirstName() %>",
                               "<%= aPerson.getAddress().getAddressLine1() %>",
                               "<%= aPerson.getAddress().getAddressLine2() %>",
                               "<%= aPerson.getAddress().getCity() %>",
                               "<%= aPerson.getAddress().getState() %>",
                               "<%= aPerson.getAddress().getPostalCode() %>",
                               "<%= aPerson.getPhone(1).getPhoneNumber() %>",
                               "<%= aPerson.getPhone(2).getPhoneNumber() %>",
                               "<%= aPerson.getPhone(3).getPhoneNumber() %>",
                               "<%=aPerson.getEmail(1).getEmailAddress() %>",
                               "<%=aPerson.getEmail(2).getEmailAddress() %>",
                               "<%=aPerson.getEmail(3).getEmailAddress() %>"
