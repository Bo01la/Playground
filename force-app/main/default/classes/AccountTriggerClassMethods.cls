// this is the class that contains the methods to handle the methods inside the trigger
public class AccountTriggerClassMethods {
  // handling the previous add contact task
  public static void addRelatedRecords(List<Account> accounts) {
    list<Contact> contacts = new List<Contact>();
    list<Opportunity> opportunities = new List<Opportunity>();
    for (Account acc : accounts) {
      if (acc.Create_Contact__c) {
        Contact cont = new Contact(
          AccountId = acc.Id,
          LastName = 'create contact checked'
        );
        contacts.add(cont);
      }

      if (acc.Create_Opportunity__c) {
        Opportunity opp = new Opportunity(
          AccountId = acc.Id,
          Name = 'create opportunity checked',
          StageName = 'Prospecting',
          CloseDate = Date.today()
        );
        opportunities.add(opp);
      }
    }

    if (!contacts.isEmpty()) {
      insert contacts;
    }

    if (!opportunities.isEmpty()) {
      insert opportunities;
    }
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
      if (
        String.isBlank(acc.BillingCountry) &&
        String.isBlank(acc.BillingCountryCode)
      ) {
        acc.BillingCountry = 'Angola';
      } else {
        acc.BillingCountry = acc.BillingCountry;
      }
      if (!String.isBlank(acc.Industry) && acc.Industry == 'Media') {
        acc.Rating = 'Hot';
      }
      if (acc.CopyBilling_ToShipping__c) {
        acc.ShippingCity = acc.BillingCity;
        acc.ShippingStreet = acc.BillingStreet;
        acc.ShippingCountry = acc.BillingCountry;
        acc.ShippingCountryCode = acc.BillingCountryCode;
      }
    }
  }

  public static void phoneHistory(
    List<Account> accounts,
    Map<Id, Account> oldAccounts
  ) {
    for (Account acc : accounts) {
      Account oldAcc = oldAccounts.get(acc.Id);
      if (acc.Phone != oldAcc.Phone) {
        acc.Description =
          'Phone is Updated! Old Value : ' +
          oldAcc.Phone +
          ' & New Value : ' +
          acc.Phone;
      }
    }
  }

  // create the method
  public static void updateContacts(
    List<Account> accounts,
    Map<Id, Account> oldAccounts
  ) {
    // set to collect Account IDs and List to collect Related contacts that will be Updated.
    Set<Id> updatedAccounts = new Set<Id>();
    List<Contact> contactsToUpdate = new List<Contact>();

    // collect the account ID with actual phoen updated
    for (Account acc : accounts) {
      Account oldAcc = oldAccounts.get(acc.Id);
      if (acc.Phone != oldAcc.Phone) {
        updatedAccounts.add(acc.Id);
      }
    }

    // collect the related contacts for these accounts
    List<Account> relatedContacts = [
      SELECT
        Id,
        Phone,
        (
          SELECT Id, HomePhone
          FROM Contacts
        )
      FROM Account
      WHERE Id IN :updatedAccounts
    ];

    // update the home phone field value of these contacts
    for (Account acc : relatedContacts) {
      for (Contact cont : acc.Contacts) {
        cont.HomePhone = acc.Phone;
        contactsToUpdate.add(cont);
      }
    }
    // update the contacts (DML)
    update contactsToUpdate;
  }

  public static void updateContactsMailingAddress(
    List<Account> accounts,
    Map<Id, Account> oldAccounts
  ) {
    // set to collect Account IDs and List to collect Related contacts that will be Updated.
    Set<Id> updatedAccounts = new Set<Id>();
    List<Contact> contactsToUpdate = new List<Contact>();

    // collect the account ID with actual phoen updated
    for (Account acc : accounts) {
      Account oldAcc = oldAccounts.get(acc.Id);
      if (
        acc.BillingCity != oldAcc.BillingCity ||
        acc.BillingCountry != oldAcc.BillingCountry ||
        acc.BillingStreet != oldAcc.BillingStreet ||
        acc.BillingState != oldAcc.BillingState ||
        acc.BillingPostalCode != oldAcc.BillingPostalCode ||
        acc.BillingCountryCode != oldAcc.BillingCountryCode ||
        acc.BillingStateCode != oldAcc.BillingStateCode
      ) {
        updatedAccounts.add(acc.Id);
      }
    }

    if (updatedAccounts.isEmpty()) {
      return;
    }

    // collect the related contacts for these accounts
    List<Account> relatedContacts = [
      SELECT
        Id,
        BillingCity,
        BillingCountry,
        BillingStreet,
        BillingState,
        BillingPostalCode,
        BillingCountryCode,
        BillingStateCode,
        (
          SELECT
            Id,
            MailingCity,
            MailingCountry,
            MailingStreet,
            MailingState,
            MailingPostalCode,
            MailingCountryCode,
            MailingStateCode
          FROM Contacts
        )
      FROM Account
      WHERE Id IN :updatedAccounts
    ];

    // update the home phone field value of these contacts
    for (Account acc : relatedContacts) {
      for (Contact cont : acc.Contacts) {
        cont.MailingCity = acc.BillingCity;
        cont.MailingCountry = acc.BillingCountry;
        cont.MailingStreet = acc.BillingStreet;
        cont.MailingState = acc.BillingState;
        cont.MailingPostalCode = acc.BillingPostalCode;
        cont.MailingCountryCode = acc.BillingCountryCode;
        cont.MailingStateCode = acc.BillingStateCode;
        contactsToUpdate.add(cont);
      }
    }
    // update the contacts (DML)
    update contactsToUpdate;
  }

  public static void closeRelatedOpportunities(
    List<Account> accounts,
    map<Id, Account> oldAccounts
  ) {
    set<Id> updatedAccounts = new Set<Id>();

    for (Account acc : accounts) {
      Account oldAcc = oldAccounts.get(acc.Id);
      if (acc.Active__c == 'No' && oldAcc.Active__c == 'Yes') {
        updatedAccounts.add(acc.Id);
      }
    }

    if (updatedAccounts.isEmpty()) {
      return;
    }

    List<Opportunity> relatedOpps = [
      SELECT Id, StageName
      FROM Opportunity
      WHERE
        AccountId IN :updatedAccounts
        AND StageName != 'Closed Won'
        AND StageName != 'Closed Lost'
    ];

    for (Opportunity opp : relatedOpps) {
      opp.StageName = 'Closed Lost';
    }

    if (!relatedOpps.isEmpty()) {
      update relatedOpps;
    }
  }

  public static void onlyAdmins(List<Account> accounts) {
    // getting the ID of the user's profile
    Id userProfileId = UserInfo.getProfileId();

    // getting the *record* of the user's profle from the profile object
    Profile userProfileName = [
      SELECT NAME
      FROM Profile
      WHERE Id = :userProfileId
      LIMIT 1
    ];

    if (userProfileName.Name != 'System Administrator') {
      for (Account acc : accounts) {
        acc.addError(
          'only admins can delete accounts ... ama tekbar eb2a garab tani.'
        );
      }
    }
  }
}
