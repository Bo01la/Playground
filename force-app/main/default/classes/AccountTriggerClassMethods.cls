// this is the class that contains the methods to handle the methods inside the trigger
public class AccountTriggerClassMethods {
  // handling the previous add contact task
  public static void addContact(List<Account> accounts) {
    list<Contact> contacts = new List<Contact>();
    for (Account acc : accounts) {
      for (Integer i = 0; i < acc.NumberofLocations__c; i++) {
        Contact cont = new Contact(
          LastName = acc.Name + ' contact ' + i,
          AccountId = acc.Id
        );
        contacts.add(cont);
      }
    }
    insert contacts;
  }

  // handling previous task (no delete account if there is a task)
  public static void noDeleteWithContact(List<Account> accounts) {
    set<Id> idOfAccountsWithContacts = new Set<Id>();
    // this is not bad practice since we used the query as a list to loop over and NOT inside the loop
    for (Contact cont : [
      SELECT AccountId
      FROM Contact
      WHERE AccountId IN :accounts
    ]) {
      idOfAccountsWithContacts.add(cont.AccountId);
    }

    for (Account acc : accounts) {
      if (idOfAccountsWithContacts.contains(acc.Id)) {
        acc.addError(
          'Mesh hadalet 7aga xD - OR, you deactivate the CreateDummyContact trigger'
        );
      }
    }
  }

  // handling this task to check if address
  public static void fillAddressIfEmpty(list<Account> accounts) {
    for (Account acc : accounts) {
      acc.BillingCity = String.isBlank(acc.BillingCity)
        ? 'added by trigger'
        : acc.BillingCity;
      acc.BillingStreet = String.isBlank(acc.BillingStreet)
        ? 'trigger street'
        : acc.BillingStreet;
      acc.BillingCountry = String.isBlank(acc.BillingCountry)
        ? 'Angola'
        : acc.BillingCountry;
      if (!String.isBlank(acc.Industry) && acc.Industry == 'Media') {
        acc.Rating = 'Hot';
      }
    }
  }
}
