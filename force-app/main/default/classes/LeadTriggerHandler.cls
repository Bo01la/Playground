public class LeadTriggerHandler {
  public static void changeLeadRating(list<Lead> leads) {
    for (Lead ld : leads) {
      ld.Rating = ld.LeadSource == 'Web' ? 'Cold' : 'Hot';
    }
  }
}
