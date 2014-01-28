<%
{
   // if no record is found, create one with the default info in it
   // default name
   EntityAttribute attribute = new EntityAttribute( dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 1, 0, 0 );
   if (!attribute.isRecordFound())
   {
      attribute.setAttributeData( businessEntity.getLastName() );
      attribute.setOwnerType( EntityAttribute.OWNERTYPE_PERSON  );
      attribute.setOwnerId( businessEntityId  );
      attribute.setAttributeDefId( 1 );
      attribute.createOrUpdateRecord("ENTITYATTRIBUTE");
   }

   // default address
   attribute = new EntityAttribute( dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 2, 0, 0  );
   if (!attribute.isRecordFound())
   {
       String addressText = entity.getAddress().getAddressLine1();
       if (!entity.getAddress().getAddressLine2().equals(""))
       {
          addressText+="\n"+entity.getAddress().getAddressLine2();
       }
       addressText += "\n"+entity.getAddress().getCity() + ", " + entity.getAddress().getState() + " " + entity.getAddress().getPostalCode();

      attribute.setAttributeData( addressText );
      attribute.setOwnerType( EntityAttribute.OWNERTYPE_PERSON  );
      attribute.setOwnerId( businessEntityId  );
      attribute.setAttributeDefId( 2 );
      attribute.createOrUpdateRecord("ENTITYATTRIBUTE");
   }

   // default phone
   attribute = new EntityAttribute( dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 3, 0, 0  );
   if (!attribute.isRecordFound())
   {
      attribute.setAttributeData( businessEntity.getPhone().getPhoneNumber() );
      attribute.setOwnerType( EntityAttribute.OWNERTYPE_PERSON  );
      attribute.setOwnerId( businessEntityId  );
      attribute.setAttributeDefId( 3 );
      attribute.createOrUpdateRecord("ENTITYATTRIBUTE");
   }

   // default email
   attribute = new EntityAttribute( dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 4, 0, 0  );
   if (!attribute.isRecordFound())
   {
      attribute.setAttributeData( businessEntity.getEmail().getEmailAddress() );
      attribute.setOwnerType( EntityAttribute.OWNERTYPE_PERSON  );
      attribute.setOwnerId( businessEntityId  );
      attribute.setAttributeDefId( 4 );
      attribute.createOrUpdateRecord("ENTITYATTRIBUTE");
   }

   // default URL
   attribute = new EntityAttribute( dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 5, 0, 0  );
   if (!attribute.isRecordFound())
   {
      attribute.setAttributeData( businessEntity.getUrl() );
      attribute.setOwnerType( EntityAttribute.OWNERTYPE_PERSON  );
      attribute.setOwnerId( businessEntityId  );
      attribute.setAttributeDefId( 5 );
      attribute.createOrUpdateRecord("ENTITYATTRIBUTE");
   }

   // default Description Text
   attribute = new EntityAttribute( dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 6, 0, 0  );
   if (!attribute.isRecordFound())
   {
      attribute.setAttributeData( "More information coming soon..." );
      attribute.setOwnerType( EntityAttribute.OWNERTYPE_PERSON  );
      attribute.setOwnerId( businessEntityId  );
      attribute.setAttributeDefId( 6 );
      attribute.createOrUpdateRecord("ENTITYATTRIBUTE");
   }
}
%>
