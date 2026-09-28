trigger positionTrigger on Position__c(before insert) {
  PositionTriggerHandler.fillValues(Trigger.new);
}
