public class PositionTriggerHandler {
  public static void fillValues(list<Position__c> positions) {
    for (Position__c pso : positions) {
      if (
        pso.new_position__c == 'New' &&
        pso.Open_Date__c == null &&
        pso.Min_Pay__c == null &&
        pso.Max_Pay__c == null
      ) {
        pso.Open_Date__c = Date.today();
        pso.Max_Pay__c = 15000;
        pso.Min_Pay__c = 10000;
      }
    }
  }
}
