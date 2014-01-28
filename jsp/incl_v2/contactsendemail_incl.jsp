<%
          MailTemplateList templateList = new MailTemplateList( dbData, templateQualifiers, sendMailType);
          if ( templateList.getRecordList().length > 0 )
          {
%>
         <form action="sendContactEmail.jsp" method="get">
             <select name="templateId">
                <option value=-1>Select Email Template</option>
<%
             for ( int j = 0; j < templateList.getRecordList().length; j++ )
             {
                MailTemplate template = (MailTemplate) templateList.getRecordList()[j];
%>
                 <option value=<%=template.getId()%>><%=template.getName()%></option>
<%
             }
%>
              </select>
              <input type="hidden" name="id" value="<%=sendMailId%>">
              <input type="hidden" name="type" value="<%=sendMailType%>">
              <input type="submit" name="compose" value="Compose Email">
          </form>
<%
          }
          else
          {
%>
             <b>[No matching mail templates available]</b>
<%
          }
%>



