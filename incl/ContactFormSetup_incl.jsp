<%
   ContactFormData contactFormData = (ContactFormData)session.getAttribute("contactFormData");
   if (contactFormData == null)
   {
      contactFormData = new ContactFormData();
      session.setAttribute( "contactFormData", contactFormData);
      dbData.getLog().logEvent( "new contactFormData object created");
   }
   else
   {
      dbData.getLog().logEvent( "existing contactFormData object found");
   }
%>
