<%@ include file="ContactFormSetup_incl.jsp" %>
<% contactFormData.populate( dbData, request, regionName, regionEmailAddress, texasWeddingsBusinessId ); %>
<% contactFormData.queue( dbData ); %>

<h2>Thank You</h2>
<p>Thank you for your inquiry! Your information has been emailed to the wedding professionals you requested. A copy of your submission has been sent to the email address you entered.</p>