public class UpdateAccountNullAddressBatch implements Database.Batchable<sObject> {
  // 1. START METHOD: Retrieve records to process
  public Database.QueryLocator start(Database.BatchableContext bc) {
    System.debug('in the start phase');

    String query = 'Select Id,BillingCity,BillingCountry from Account WHERE BillingCountry = null OR BillingCity = null';

    return Database.getQueryLocator(query);
  }

  // 2. EXECUTE METHOD: Process each chunk of records (the accounts list is passed from the return of the start method)
  public void execute(Database.BatchableContext bc, List<Account> accounts) {
    System.debug('in the execute phase');
    for (Account acc : accounts) {
      if (String.isBlank(acc.BillingCountry)) {
        acc.BillingCountry = 'Egypt';
      }
      if (String.isBlank(acc.BillingCity)) {
        acc.BillingCity = 'added by batch apex';
      }
    }

    if (!accounts.isEmpty()) {
      update accounts;
    }
  }

  // 3. FINISH METHOD: Post-batch actions
  public void finish(Database.BatchableContext bc) {
    System.debug('ya 7alawa ya wlaaaahhhh');
  }
}
