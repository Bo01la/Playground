// this part is added to SF UI in the object manager -> triggers -> new trigger
// NOTE: we modified the preious trigger and class above to handle both last task and this task
trigger CreateDummyContact on Account(
  after insert,
  before insert,
  before delete
) {
  if (Trigger.isAfter) {
    if (Trigger.isInsert) {
      // if the context is to insert record, the first task (insert contact) will be executed.
      AccountTriggerClassMethods.addContact(Trigger.new);
    }
  } else if (Trigger.isBefore) {
    if (Trigger.isDelete) {
      // handling the delete requested task
      AccountTriggerClassMethods.noDeleteWithContact(Trigger.old);
    } else if (Trigger.isInsert) {
      // handle the task of filling the address fields if empty
      AccountTriggerClassMethods.fillAddressIfEmpty(Trigger.new);
    }
  }
}
