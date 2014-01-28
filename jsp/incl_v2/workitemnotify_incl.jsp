<%
{
    EntityGroup aGroup = new EntityGroup( dbData, workItem.getOwnerId() );

    String msgText = "Work item: <b><u>\""
                     + workItem.getDescription()
                     + "\"</u></b> has been "
                     + msg
                     + " by "
                     + userPerson.getFirstName()
                     + " "
                     + userPerson.getLastName()
                     + ".  <p>It is assigned to group <b><i>"
                     + aGroup.getName()
                     + "</i></b><p>The severity is: <b><i>"
                     + WorkItem.severityText[ workItem.getSeverity() ]
                     + "</i></b>."
                     + "<p>The status is: <b><i>"
                     + workItem.statusText[ workItem.getStatus()     ]
                     + "</i></b>."
                     + "<p><font size=-1><i>Work items assigned to you and opened by you may be viewed from your account home page.</i></font>";


   String workItemNotificationName = SiteProperty.valueOf( dbData, "WorkItemNotification" );
   String workItemAdminEmailAddress = SiteProperty.valueOf( dbData, "WorkItemAdminEmailAddress" );
   String batchMail = SiteProperty.valueOf( dbData, "batchMail" );

   SMTPClient smtpClient = new SMTPClient( "localhost",
                                           workItemNotificationName,
                                           workItemAdminEmailAddress );

   Person itemOriginator = new Person( dbData, workItem.getOriginator() );
   itemOriginator.deepPopulate();

   smtpClient.sendMail( itemOriginator.getFirstName() + " " + itemOriginator.getLastName(),
                        itemOriginator.getEmail().getEmailAddress(),
                        workItem.getDescription(),
                        msgText,
                        "text/html" );

   smtpClient.sendMail( "maillist-group-0-"+workItem.getOwnerId()+"-",
                        batchMail,
                        workItem.getDescription(),
                        msgText,
                        "text/html" );
}
%>
