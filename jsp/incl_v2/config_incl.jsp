<%
   int dateBeginYear = 2004; // used by date/time control;  need to define and init variables here
   int dateEndYear = 2020; // used by date/time control;  need to define and init variables here
   int historyLimit = 25; //default to last 5 history items

 // variables that control the group_incl code
   int groupUpdateType = GroupCategory.UPDATETYPE_DEFAULT;
   int groupAssociatedWithType = -1;
   int groupAssociatedWithId = -1;

   boolean showAvailGroups = true;
   boolean incl_std_person_group_block = true;

   boolean showEmailSubscribe = true;
   boolean isCISInstalled = false;
   if (request.getSession().getServletContext().getContext( "/cis" ) != null ) isCISInstalled = true;
%>
