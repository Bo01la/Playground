trigger opportunityTrigger on Opportunity(before insert) {
  OpportunityTriggerHandler.changeDesription(Trigger.new);
}
