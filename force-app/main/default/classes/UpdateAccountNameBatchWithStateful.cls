public class UpdateAccountNameBatchWithStateful implements Database.Batchable<sObject>, Database.Stateful {
  Integer numberOfUpdatedRecords = 0;

  public Database.QueryLocator start(Database.BatchableContext bc) {
    String query = 'select id,BillingCity, AccountNumber, BillingCountry, BillingStreet, BillingState, Name from Account where BillingCountry = \'Egypt\'';
    return Database.getQueryLocator(query);
  }

  public void execute(Database.BatchableContext bc, List<Account> accounts) {
    for (Account acc : accounts) {
      numberOfUpdatedRecords++;
      acc.Name = 'Batched ' + numberOfUpdatedRecords;
    }
    if (!accounts.isEmpty()) {
      update accounts;
    }
  }

  public void finish(Database.BatchableContext bc) {
    System.debug('number of updated records is = ' + numberOfUpdatedRecords);
  }
}
