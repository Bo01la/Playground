public with sharing class GetAccountsForSearchAccountsLWC {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts(String accountName) {
    try {
      String key = '%' + accountName + '%';
      return [SELECT Id, Name FROM Account WHERE Name LIKE :key];
    } catch (Exception e) {
      throw new AuraHandledException(
        'We found an error ::=> ' + e.getMessage()
      );
    }
  }
}
