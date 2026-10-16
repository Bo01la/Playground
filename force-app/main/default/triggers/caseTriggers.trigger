trigger caseTriggers on Case(before insert, after insert) {
  if (Trigger.isBefore) {
    if (Trigger.isInsert) {
      CaseTriggersClassHandler.changeStatus(Trigger.new);
    }
  }

  if (Trigger.isAfter) {
    if (Trigger.isInsert) {
      CaseTriggersClassHandler.updateRelatedAccount(Trigger.new);
    }
  }
}
