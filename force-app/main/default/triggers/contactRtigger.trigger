trigger contactRtigger on Contact(after insert) {
  ContactTriggerHandler.sendEmail(Trigger.new);
}
