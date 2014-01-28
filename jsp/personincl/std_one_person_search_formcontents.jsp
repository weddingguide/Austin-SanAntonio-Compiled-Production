          <%
             boolean search = true;
             boolean forceReadWrite = false;

             String addressLabel;
             String addressType;
             Address address;

             String emailLabel;
             String emailType;
             Email email;

             String phoneLabel;
             String phoneType;
             Phone phone;

             String personLabel = "_" + pageGroupPrefix;
             String personType  = entityType;
          %>
       <i><font size=-1>Enter any portion of any field to find entries that match the specified values:</font></i>
     <%@ include file="std_person_entry_block.jsp" %>
