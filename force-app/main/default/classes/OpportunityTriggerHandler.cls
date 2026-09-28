public class OpportunityTriggerHandler {
  public static void changeDesription(list<Opportunity> opportunities) {
    for (Opportunity opp : opportunities) {
      if (opp.Amount > 100000 && opp.Amount != null) {
        opp.Description = 'Hot "added by trigger"';
      }
    }
  }
}
