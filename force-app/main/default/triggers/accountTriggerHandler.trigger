// this part is added to SF UI in the object manager -> triggers -> new trigger
// NOTE: we modified the preious trigger and class above to handle both last task and this task
trigger accountTriggerHandler on Account(
  after insert,
  before insert,
  before delete,
  before update,
  after update
) {
  if (Trigger.isAfter) {
    if (Trigger.isInsert) {
      // if the context is to insert record, the first task (insert contact) will be executed.
      AccountTriggerClassMethods.addRelatedRecords(Trigger.new);
    }
    if (Trigger.isUpdate) {
      AccountTriggerClassMethods.updateContacts(Trigger.new, Trigger.oldMap);
      AccountTriggerClassMethods.updateContactsMailingAddress(
        Trigger.new,
        Trigger.oldMap
      );
      AccountTriggerClassMethods.closeRelatedOpportunities(
        Trigger.new,
        Trigger.oldMap
      );
    }
  } else if (Trigger.isBefore) {
    if (Trigger.isDelete) {
      // handling the delete requested task
      AccountTriggerClassMethods.noDeleteWithContact(Trigger.old);
      AccountTriggerClassMethods.onlyAdmins(Trigger.old);
    } else if (Trigger.isInsert) {
      // handle the task of filling the address fields if empty
      AccountTriggerClassMethods.fillAddressIfEmpty(Trigger.new);
    } else if (Trigger.isUpdate) {
      AccountTriggerClassMethods.phoneHistory(Trigger.new, Trigger.oldMap);
    }
  }
}
