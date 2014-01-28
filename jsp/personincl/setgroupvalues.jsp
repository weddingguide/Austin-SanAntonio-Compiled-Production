<script>
   function getDetails( id )
   {
      <%
         for ( int i = 0; i < availGroups.getRecordList().length; i++ )
         {
             EntityGroup aGroup = (EntityGroup) availGroups.getRecordList()[i];
             if (!aGroup.getGroupCategory().getDetailsURL().equals("") )
             {
      %>
                if ( id == <%=aGroup.getGroupNum()%> ) return( "<%=aGroup.getGroupCategory().getDetailsURL()%>" );
      <%
             }
         }
         for ( int i = 0; i < currGroups.getRecordList().length; i++ )
         {
             EntityGroup aGroup = (EntityGroup) currGroups.getRecordList()[i];
             if (!aGroup.getGroupCategory().getDetailsURL().equals("") )
             {
      %>
                if ( id == <%=aGroup.getGroupNum()%> ) return( "<%=aGroup.getGroupCategory().getDetailsURL()%>" );
      <%
             }
         }
      %>
         return("");
   }
</script>
