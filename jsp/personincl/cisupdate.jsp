<%
     if( newFormSubmit )
     {
        session.putValue( "lastFormInstanceId", submittedFormInstanceId );




        if ( request.getParameter( "cisaction" ) != null )
        {
           String personLabel = pageGroupPrefix;

           Person contact = new Person( dbData,  personId ); //load from db
           contact.deepPopulate();                                                                        // populate from db

           if ( request.getParameter( "cisaction" ).equals( "Submit" ) )
           {
              contact.populateObject( request, personLabel );                                                //update from form
              contact.deepPopulate(request, personLabel );

              contact.setOwnerType( Person.OWNERTYPE_CLIENT );

              if ( request.getParameter( "omitGroups" ) != null ) contact.setUpdateGroups( false );

              boolean updateFlag = contact.isRecordFound();

              contact.createOrUpdateRecord( "PERSON" );
              personId = contact.getPersonId();      // may need later for query

              if ( updateFlag )
              {
                 new History( dbData, currUser.getUserName(), History.OWNERTYPE_PERSON, personId, History.TYPE_RECORD_UPDATE, "update","", "HISTORY" );
              }
              else
              {
                 new History( dbData, currUser.getUserName(), History.OWNERTYPE_PERSON, personId, History.TYPE_RECORD_CREATION, "Record Created","", "HISTORY" );
              }
           }

           if ( request.getParameter( "cisaction" ).equals( "Remove" ) )
           {
              contact.setStatus( Person.STATUS_REMOVED );
              contact.createOrUpdateRecord( "PERSON" );
              new History( dbData, currUser.getUserName(), History.OWNERTYPE_PERSON, personId, History.TYPE_RECORD_UPDATE, "remove","", "HISTORY" );
           }

           if ( request.getParameter( "cisaction" ).equals( "Save This Query" ) )
           {
              dbData.getLog().logEvent( "Save This Query...." );
              int queryType = Person.RECORDTYPE_PERSON;
              if ( request.getParameter( "business" ) != null ) queryType = Person.RECORDTYPE_BUSINESS_ORG;

              SavedQuery savedQuery = new SavedQuery( dbData );
              if (( request.getParameter( "queryname" ) != null )
                 &&( !request.getParameter( "queryname" ).equals( "" ) ) )
              {
                 savedQuery.setName( request.getParameter( "queryname" ) );
                 savedQuery.setQueryString( (String)session.getAttribute( "queryString") );
                 savedQuery.setQueryType( queryType );
                 savedQuery.createRecord( "SAVEDQUERY" );
              }
           }

        }


     }


%>
