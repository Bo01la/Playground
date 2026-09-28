trigger caseTriggers on Case(before insert) {
  CaseTriggersClassHandler.changeStatus(Trigger.new);
}
