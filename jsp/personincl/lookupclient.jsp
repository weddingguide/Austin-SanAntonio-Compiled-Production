       <%
           PersonList aPersonList = null;
           Person client = new Person( dbData, -1 );

           aPersonList = new PersonList( dbData, request, "client", -1, -1, Person.OWNERTYPE_CLIENT, -1 );

           if (( aPersonList != null ) && ( aPersonList.getRecordList().length > 0 ))
           {
              client = (Person)aPersonList.getRecordList()[0];
           }
        %>
