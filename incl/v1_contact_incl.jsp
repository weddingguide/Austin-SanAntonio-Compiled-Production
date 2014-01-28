<script>
  function validateForm(form, vendors)
  {
     form.scriptrun.value = new Date();

     if ( form.lastName.value == "" )
     {
        alert( "Please enter your last name." );
        return(false);
     }

     if ( form.email.value == "" )
     {
        alert( "Please enter your email address." );
        return(false);
     }

     var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
     if (filter.test(form.email.value) == false)
     {
        alert("Please input a valid email address.")
        return(false);
     }

  <% if (request.getParameter("businessEntityId") == null ) { %>

      for ( i = 0; i < 500; i++ )
      {
         {
            if ( vendors[i] == null ) break;  // if null we've reached the end
            if ( vendors[i].checked == true ) return(true);
         }
      }
      alert( "You must select at least one Wedding Professional to contact." );
      return(false);
  <% } %>

   return(true);

  }
</script>

<script type="text/javascript">
   checked=false;

   function checkAll(vendors)
   {
      if (checked == false)
      {
         checked = true
      }
      else
      {
         checked = false
      }
      for ( i = 0; i < 500; i++ )
      {
         {
            if ( vendors[i] == null ) break;  // if null we've reached the end
            vendors[i].checked= checked;
         }
      }
   }

</script>


<!-- Script by hscripts.com -->


<%@ page import="java.util.Calendar" %>
  <%     Calendar cal = Calendar.getInstance();
         String datePrefix;
         String dateSuffix;
         String timePrefix;
         String timeSuffix;

         int theMonth =1;
         int theDay =1;
         int theYear=0;
         int theHour=0;
         int theMinute = 0;
         int theAMPM = 1;
         int numDays=0;
    %>



    <div class="category-form">
       <div id="stylized" class="myform">
         <form id="form1" name="form1" method="post" action="/contact_response.jsp">
            <input type=hidden name=popup id=popup value=true>

            <% if (request.getParameter("businessEntityId") != null ) { %>
                  <h1><%=businessEntityName%></h1>
            <% } %>

           <fieldset>

              <legend>Contact Information</legend>

              <label>First Name</label>
              <input type="text" name="firstName" id="firstName" value="<%=contactFormData.firstName%>" />


              <label>Last Name</label>
              <input type="text" name="lastName" id="lastName" value="<%=contactFormData.lastName%>" />

              <label>I am </label>
              <select name="me" id="me">
                  <option value="notSpecified"></option>
                  <option value="bride" <% if (contactFormData.me.equals("bride")) out.print(" selected=\"SELECTED\"" );%>>the bride</option>
                  <option value="groom" <% if (contactFormData.me.equals("groom")) out.print(" selected=\"SELECTED\"" );%>>the groom</option>

                  <option value="other" <% if (contactFormData.me.equals("other")) out.print(" selected=\"SELECTED\"" );%>>other</option>
              </select>

              <label>Email</label>
              <input name="email" type="text" id="email"  value="<%=contactFormData.email%>" />

              <label>Phone</label>
              <input type="text" name="phone" id="phone"  value="<%=contactFormData.phone%>"/>

           </fieldset>


           <fieldset>

              <legend>Wedding Information</legend>


              <label>Wedding Date</label>
                                                  <% { // local scope to prevent dup variables


                                                           try
                                                           {
                                                              cal.set( Calendar.YEAR,new Integer( contactFormData.year).intValue() );
                                                              cal.set( Calendar.MONTH,new Integer( contactFormData.month).intValue()-1 );
                                                              cal.set( Calendar.DATE,new Integer( contactFormData.day).intValue() );
                                                           }
                                                           catch( Exception e) // if values not set, exception will occur, just use defaults
                                                           {
                                                           }
                                                           theYear = cal.get( Calendar.YEAR );
                                                           theMonth = cal.get( Calendar.MONTH )+1;
                                                           theDay = cal.get( Calendar.DATE );
                                                           datePrefix = "date";
                                                           dateSuffix = "";
                                                           String setDaysFn = "setDaysSingle"; %>
                                                          <%@ include file="dateincl.jsp" %>
                                                  <% } %>

<%  if ( request.getParameter( "Facilities" ) == null ) { %>

              <label>Ceremony Location</label>
              <input type="text" name="ceremonyLoc" id="ceremonyLoc" value="<%=contactFormData.ceremonyLoc%>"/>


              <label>Reception Location</label>
              <input type="text" name="receptionLoc" id="receptionLoc" value="<%=contactFormData.receptionLoc%>"/>
<% } %>

              <input type=hidden name=scriptrun value="*">

           </fieldset>

           <fieldset>

              <legend>Additional Comments</legend>

              <label>Comments</label>
              <textarea name="comments" cols="25" rows="5" id="comments" ><%=contactFormData.comments%></textarea>

           </fieldset>

<%            if (request.getParameter("businessEntityId") != null )
              {
%>
                <input type=hidden name=vendor id=businessEntityId value=<%=businessEntityId%> >
<%            }
              else
              { //category
                 int category = jspUtils.getIntParm( "category" );
%>
                 <input type=hidden name=category id=category value=<%=category%> >
<%
                 PersonList aVendorList = new PersonList( dbData, EntityGroup.TYPE_GENERAL, regionGroup, jspUtils.getIntParm( "category" ), 1, Person.RECORDTYPE_BUSINESS_ORG, false ); // just set up query... this constructor will not execute it
                 aVendorList.doQuery( 0, 1000 ); // 1000 means basically give me all...
%>
                 <fieldset class="checks">
                     <legend>Wedding Professionals</legend>
                     <p>Check "all" to have all the professionals in this category respond to your request. You may uncheck those professionals you do not wish to contact.</p>

                     <div><input type="checkbox" name="all" id="all" value="all" onclick="checkAll(document.form1.vendor);" /><label>All</label></div>


<%
                     for (int i=0; i< aVendorList.getRecordList().length; i++ )
                     {
                        Person aVendor = (Person) aVendorList.getRecordList()[i];
                        businessEntityId = aVendor.getPersonId();
                        String bName =  EntityAttributeList.getAttributeValue(dbData, EntityAttribute.OWNERTYPE_PERSON, businessEntityId, 1, 0);
%>
                         <div><input type="checkbox" name="vendor" id="vendor" value="<%=businessEntityId%>" /><label><%=bName%></label></div>
<%                   } %>

                 </fieldset>
<%            } %>

              <button type="submit" id="submit"  onClick='return(validateForm(this.form, document.form1.vendor));'>Submit</button><button type="reset" id="cancel">Cancel</button>
         </form>
       </div>
    </div>


