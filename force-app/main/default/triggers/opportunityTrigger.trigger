trigger opportunityTrigger on Opportunity(
  before insert,
  after insert,
  after update,
  before update,
  before delete
) {
  if (Trigger.isBefore) {
    if (Trigger.isInsert) {
      OpportunityTriggerHandler.changeDesription(Trigger.new);
    } else if (Trigger.isUpdate) {
      OpportunityTriggerHandler.checkReason(Trigger.new, Trigger.oldMap);
    } else if (Trigger.isDelete) {
      OpportunityTriggerHandler.onlyAdminCanChange(Trigger.old);
    }
  }

  if (Trigger.isAfter) {
    if (Trigger.isInsert) {
      OpportunityTriggerHandler.manipulateAccount(Trigger.new);
    } else if (Trigger.isUpdate) {
      OpportunityTriggerHandler.createTask(Trigger.new, Trigger.oldMap);
    }
  }
}
