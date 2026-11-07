public with sharing class userCardGetAccountDetailsLWC {
  @AuraEnabled
  public static List<Account> getAccountDetails(string accountName) {
    try {
      return [
        SELECT Id, Name, Industry
        FROM Account
        WHERE Name = :accountName
        LIMIT 1
      ];
    } catch (Exception e) {
      throw new AuraHandledException(
        'unable to get the account :: ' + e.getMessage()
      );
    }
  }
}
