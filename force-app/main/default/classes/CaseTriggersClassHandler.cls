public class CaseTriggersClassHandler {
  public static void changeStatus(list<Case> cases) {
    for (Case cs : cases) {
      if (cs.Origin == 'Email') {
        cs.Status = 'New';
        cs.Priority = 'Medium';
      }
    }
  }

  public static void updateRelatedAccount(List<Case> cases) {
    List<Account> accounts = new List<Account>();
    for (Case cs : cases) {
      Account acc = new Account(
        Id = cs.AccountId,
        Latest_Case_Number__c = cs.CaseNumber
      );
      accounts.add(acc);
    }
    update accounts;
  }
}
