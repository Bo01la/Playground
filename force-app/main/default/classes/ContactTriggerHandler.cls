public class ContactTriggerHandler {
  public static void sendEmail(List<Contact> contacts) {
    // hardcoded IDs should ideally be retrieved dynamically or via Custom Settings/Metadata
    Id templateId = '00XgL00000Yxf5C';

    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    for (Contact cont : contacts) {
      // Ensure Contact has an ID (after insert) and an Email address
      if (cont.Id != null && String.isNotBlank(cont.Email)) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

        // setTargetObjectId automatically sets the recipient to cont.Email and binds template merge fields
        message.setTargetObjectId(cont.Id);
        message.setTemplateId(templateId);
        message.setSaveAsActivity(true);

        emails.add(message);
      }
    }

    // Send the list of emails in a single bulkified call
    if (!emails.isEmpty()) {
      Messaging.sendEmail(emails);
    }
  }
}
