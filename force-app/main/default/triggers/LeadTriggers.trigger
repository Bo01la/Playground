trigger LeadTriggers on Lead(before insert) {
  LeadTriggerHandler.changeLeadRating(Trigger.new);
}
