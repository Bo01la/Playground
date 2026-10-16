trigger employeeTrigger on Employee__c(
  after delete,
  after insert,
  after undelete
) {
  if (Trigger.isAfter) {
    if (Trigger.isDelete) {
      EmployeeTriggerHandler.removedEmployees(Trigger.old);
      EmployeeTriggerHandler.presentEmployees(Trigger.old);
    } else if (Trigger.isInsert) {
      EmployeeTriggerHandler.presentEmployees(Trigger.new);
    } else if (Trigger.isUndelete) {
      EmployeeTriggerHandler.presentEmployees(Trigger.new);
    }
  }
}
