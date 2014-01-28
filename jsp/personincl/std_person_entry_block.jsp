<%    boolean readOnly  = true;
      dbData.getLog().logEvent( "---------------------------- determining read-only status" );
      if (  ( request.isUserInRole( "CISOperator" ))
         || ( ( request.isUserInRole( "CISUser" )) && (person.getPersonId() == userPerson.getPersonId()) ) // user can only see/change own info.  Higher level page must enforce this
         || ( forceReadWrite )                  // added for creating account for cart 3-6-06 -- will need to fix in other calling apps
         || (( jspUtils.getIntParm( "recordType") == Person.RECORDTYPE_BUSINESS_ORG)) && (EntityGroup.isMemberOfGroup( dbData, jspUtils.getIntParm( "businessEGId"), Person.RECORDTYPE_PERSON, userPerson.getPersonId() )  )
         || ( EntityGroup.isMemberOfGroup( dbData, jspUtils.getIntParm( "contactcontainer"), Person.RECORDTYPE_PERSON, userPerson.getPersonId() )  )
         || ( search ) )
      {
         readOnly = false;
      }



%>

        <table class=tablebackground border="0">
          <tr>
             <% if ( person.getRecordType() == Person.RECORDTYPE_PERSON ) { %>

                  <% if ( !readOnly) { %>

                          <td class="prompt">
                             <%=personType%> Name
                          </td>

                          <td class="prompt" colspan=2>
                            <table class="row1" style="margin-top: 10px">
                              <tr>
                                <td>
                                    <input name="lastName<%=personLabel%>" type="text" size="15" maxlength="50"   value="<%= person.getLastName() %>">
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <input name="firstName<%=personLabel%>" type="text" size="15" maxlength="50"  value="<%= person.getFirstName() %>">
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <input name="middleName<%=personLabel%>" type="text" size="15" maxlength="50" value="<%= person.getMiddleName() %>">
                                <td>
                              </tr>
                              <tr>
                                <td><font style="font-size:8pt">Last</font></td>
                                <td>&nbsp;</td>
                                <td><font style="font-size:8pt">First</font></td>
                                <td>&nbsp;</td>
                                <td><font style="font-size:8pt">Middle</font></td>
                              </tr>
                             </table>
                              <input type=hidden name=recordType value=<%=Person.RECORDTYPE_PERSON%>>
                          </td>

                  <% } else { %>
                          <td class="prompt"><%=personType%> Name</td>
                          <td class="prompt">
                              <%= person.getLastName() %>, <%= person.getFirstName() %> <%= person.getMiddleName() %>
                          </td>
                  <% } %>

            <% } else if ( person.getRecordType() == Person.RECORDTYPE_CUSTOMER )  { // this is a business or organization record %>
                          <td class="prompt">Customer Name</td>
                  <% if ( !readOnly) { %>
                          <td class="prompt">
                              <input name="lastName<%=personLabel%>" type="text" size="50" maxlength="200"   value="<%= person.getLastName() %>">
                              <input type=hidden name=recordType value=<%=Person.RECORDTYPE_CUSTOMER%>>
                          </td>
                  <% } else { %>
                          <td class="prompt">
                              <%= person.getLastName() %> %>
                          </td>
                  <% } %>

            <% } else { // this is a business or organization record %>
                          <td class="prompt">Business or Organization Name</td>
                  <% if ( !readOnly) { %>
                          <td class="prompt">
                              <input name="lastName<%=personLabel%>" type="text" size="50" maxlength="200"   value="<%= person.getLastName() %>">
                              <input type=hidden name=recordType value=<%=Person.RECORDTYPE_BUSINESS_ORG%>>
                          </td>
                  <% } else { %>
                          <td class="prompt">
                              <%= person.getLastName() %> %>
                          </td>
                  <% } %>
            <% } %>
          </tr>

         <%
             for ( int jj = 0; jj < customText.getInstanceCount(person.getRecordType(), EntityCustomText.OBJECTTYPE_ADDRESS); jj++ )
             {
             addressLabel = personLabel+"_"+jj;
             addressType  = customText.text [person.getRecordType()]  [EntityCustomText.OBJECTTYPE_ADDRESS]  [jj]  [EntityCustomText.TEXTTYPE_LONG];
             address = person.getAddress(jj);
          %>
             <%@ include file="addressincl.jsp" %>
             <% if (search) break; %>
            <% } %>


         <%
             for ( int jj = 0; jj < customText.getInstanceCount(person.getRecordType(), EntityCustomText.OBJECTTYPE_PHONE); jj++ )
             {
                phoneLabel = personLabel+"_"+jj;
                phoneType  = customText.text [person.getRecordType()]  [EntityCustomText.OBJECTTYPE_PHONE]  [jj]  [EntityCustomText.TEXTTYPE_LONG];
                phone = person.getPhone(jj);
          %>
              <tr>
               <td colspan=3>
                 <%@ include file="phoneincl.jsp" %>
               </td>
              </tr>
             <% if (search) break; %>
            <% } %>


         <%
             for ( int jj = 0; jj < customText.getInstanceCount(person.getRecordType(), EntityCustomText.OBJECTTYPE_EMAIL); jj++ )
             {
                emailLabel = personLabel+"_"+jj;
                emailType  = customText.text [person.getRecordType()]  [EntityCustomText.OBJECTTYPE_EMAIL]  [jj]  [EntityCustomText.TEXTTYPE_LONG];
                email = person.getEmail(jj);
          %>
              <tr>
               <td colspan=3>
                 <%@ include file="emailincl.jsp" %>
               </td>
             </tr>

             <% if (search) break; %>
            <% } %>

    <% if ( !search )
       {
    %>
         <% if ( customText.getInstanceCount( person.getRecordType(), EntityCustomText.OBJECTTYPE_SEX     ) > 0 )   // having an entry in entityCustomText table for sey controls whether this field appears
            {
         %>
            <tr>
               <td class="prompt">
                  <%= customText.text [person.getRecordType()]  [EntityCustomText.OBJECTTYPE_SEX]  [0]  [EntityCustomText.TEXTTYPE_LONG] %>
               </td>
               <td class="prompt" colspan=2>
                 <input type=radio <% if (person.getSex() == Person.SEX_M) out.print(" CHECKED " ); %>name=sex<%=personLabel%> value=<%=Person.SEX_M%>>Male
                 &nbsp;&nbsp;<input type=radio <% if (person.getSex() == Person.SEX_F) out.print(" CHECKED " ); %>name=sex<%=personLabel%> value=<%=Person.SEX_F%>>Female
               </td>
         <% } %>

         <% if ( customText.getInstanceCount( person.getRecordType(), EntityCustomText.OBJECTTYPE_BIRTHDAY) > 0 )   // having an entry in entityCustomText table for birthday controls whether this field appears
            {
         %>

            <tr>
               <td class="prompt">
                  <%= customText.text [person.getRecordType()]  [EntityCustomText.OBJECTTYPE_BIRTHDAY]  [0]  [EntityCustomText.TEXTTYPE_LONG] %>
               </td>
               <td class="prompt" colspan=2>
                  <% if (!readOnly) { %>
                          <% Calendar cal = Calendar.getInstance(); %>
                          <% cal.setTime( person.getBirthDate() ); %>
                          <% int theYear = cal.get( Calendar.YEAR );  %>
                          <% int theMonth = cal.get( Calendar.MONTH )+1; %>
                          <% int theDay = cal.get( Calendar.DATE );  %>
                          <% String datePrefix = "birthDate"; %>
                          <% String dateSuffix = "_contact"; %>
                          <% String setDaysFn = "setDaysSingle"; %>
                          <% int theMinute = 0; %>
                          <% int theAMPM = 0; %>
                          <% int numDays; %>
                          <% dateBeginYear = 1935; // dateEndYear will use default set in stdHeader %>
                          <%@ include file="../datetimeincl/dateincl.jsp" %>
                  <% } else { %>
                      <%= person.getBirthDate() %>
                  <% } %>
               </td>
            </tr>
         <% } %>

         <tr>
           <td colspan=3>
            <label for="url<%=personLabel%>">URL</label>
               <% if (!readOnly) { %>
                   <input name="url<%=personLabel%>" type="text" size="30" maxlength="50"   value="<%= person.getUrl() %>">
               <% } else { %>
                   <%= person.getUrl() %>
               <% } %>
            </td>
        </tr>

     <% } %>

        </table>


     <% if ( incl_std_person_group_block ) { %>
        <%@ include file="std_person_group_block.jsp" %>
     <% } %>


