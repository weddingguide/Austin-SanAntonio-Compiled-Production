
   <input type=hidden name=groupincl value=true>

   <% EntityGroupList currGroups = new EntityGroupList( dbData, groupType, person.getRecordType(), person.getPersonId(), groupUpdateType, groupAssociatedWithType, groupAssociatedWithId );
      EntityGroupList availGroups = new EntityGroupList( dbData, groupType, person.getRecordType(), currGroups, groupUpdateType  );
      dbData.getLog().logEvent( "............return from getting groupLists" );
   %>

