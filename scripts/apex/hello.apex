//*this File inlcudes basics of APEX and Trigger good examples / practices*/

// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// String stt = 'hello';

// system.debug(stt.indexOf('h'));
// system.debug(stt.capitalize());
// system.debug(stt.toUpperCase());
// system.debug(stt.toLowerCase());
// System.debug(msg);

// --------------------------------------------------------------------

// List<Account> myAcc = new List<Account>();
// myAcc = [SELECT Name
// FROM Account
// WHERE Name = 'My Azz'
// ];

// system.debug(myAcc.size());

// for (Account Acc : MyAcc) {
//   acc.Name = 'Azz Bss';
// }

// update myAcc ;

// --------------------------------------------------------------------

// List<Account> myAcc = new List<Account>();

// myAcc = [
//   SELECT Name
//   FROM Account
//   WHERE Name LIKE 'uni%'
// ];

// system.debug(myAcc.size());
// Integer x = 1;

// for (Account Acc : myAcc) {
//   Acc.Name = 'updated ' + x;
//   x++;
// }

// System.debug(myAcc);
// update myAcc;

// List<Case> myCase = new List<Case>();

// myCase = [
//   SELECT Status
//   FROM Case
//   WHERE Status = 'New'
// ];

// for (Case cs : myCase) {
//   cs.OwnerId = '005gL00000NXP2PQAX';
// }

// update myCase;

// --------------------------------------------------------------------

// List<member_policy__c> memberPolicy = new List<member_policy__c>();

// memberPolicy = [
//   SELECT Id
//   FROM member_policy__c
// ];

// List<claim_line_item__c> claimLineItems = new List<claim_line_item__c>();

// claimLineItems = [
//   SELECT
//     Id,
//     status__c,
//     related_member_policy__r.Id,
//     related_member_policy__r.Name
//   FROM claim_line_item__c
//   WHERE related_member_policy__c IN :memberPolicy
// ];

// system.debug(claimLineItems.size());

// for (claim_line_item__c lit : claimLineItems) {
//   if (lit.related_member_policy__r.Id == 'a03gL000017aYOPQA2') {
//     lit.status__c = null;
//   } else {
//     lit.status__c = 'Approved';
//   }
// }

// update claimLineItems;

// --------------------------------------------------------------------
//(below is a better approach for the same code above)

// List<claim_line_item__c> claimLineItem = new List<claim_line_item__c>();

// claimLineItem = [
//   SELECT
//     Id,
//     Name,
//     related_member_policy__r.Name,
//     related_member_policy__r.Id,
//     status__c
//   FROM claim_line_item__c
// ];

// for (claim_line_item__c lt : claimLineItem) {
//   if (lt.related_member_policy__r.Id == 'a03gL000017qdK6QAI') {
//     lt.status__c = null;
//   }
// }

// update claimLineItem;

// --------------------------------------------------------------------

/* the class I created via developer consol in SF:
public class Calculator {
  public integer num1;
  public integer num2;
  public decimal result;
  public string operator;

  public void display(){
      calculation(num1, num2, operator);
    System.debug(num1 + ' ' + operator + ' ' + num2 + ' = ' + result  );
  }

  private decimal calculation (integer n1, integer n2, string op){
    switch on op.trim() {
      when '+' {
        result = n1 + n2;
        return result;
      }
      when '-' {
        result = n1 - n2;
        return result;
      }
      when '*' {
        result = n1 * n2;
        return result;
      }
      when '/' {
        if (n2 != 0) {
          result = n1 * n2;
        }
        else {
          System.debug('we can not devide on 0 !!');
          return -1;
        }
        return result;
      }
      when else {
        System.debug('enter a valid operator + - / *');
        return -1 ;
      }
    }
  }
}
*/
// // below is an istance of the Calculator class
// Calculator operation1 = new Calculator();
// operation1.num1 = 10;
// operation1.num2 = 0;
// operation1.operator = '/';
// operation1.display();

// --------------------------------------------------------------------

// correct way to write a class (must include a constructor, variables are private and methods are public)
/*
public class Cars {
  private string brand;
  private integer year;
  private integer speed;

          // constructor method (we do not add void or any return type to constructors) we also must use this. when assigning variables 
  public  Cars(string brand, integer year, integer speed) {
    this.brand = brand;
    this.year = year;
    this.speed = speed;
  }

            // constructor method (we do not add void or any return type to constructors) we also must use this. when assigning variables 
  public  Cars() {
    this.brand = 'default: audi';
    this.year = 1993;
    this.speed = 100;
  }

  private Integer speedUp() {
    this.speed += 20;
    return this.speed;
  }

  public void currentStatus() {
    system.debug('brand: ' + brand + ' year: ' + year + ' speed: ' + speed);
  }

  public void accelirate() {
    speedUp();
    system.debug('brand: ' + brand + ' year: ' + year + ' speed: ' + speed);
  }
}
*/
// below is an instance of the class Cars

// System.debug('a class with values assigned using constructor');
// Cars car1 = new Cars('mercedes', 2026, 200);
// car1.currentStatus();
// car1.accelirate();

// System.debug('a class with default values using default constructor');
// Cars car2 = new Cars();
// car2.currentStatus();
// car2.accelirate();

// --------------------------------------------------------------------

/*
public class FootballTeam {
  string name;
  integer age;
  static string club = 'Digla';

  // creating a constructor method:
  public FootballTeam(string name, integer age) {
    this.name = name;
    this.age = (age < 15 || age > 40) ?  -1 : age;
  }

  // creating a default constructor method:
  public FootballTeam() {
    this.name = 'default player';
    this.age = 11;
  }

  public void display() {
    system.debug(name + ' ' + age + ' ' + club);
  }
}
*/

// FootballTeam p1 = new FootballTeam('Abo treka', 39);
// p1.display();
// FootballTeam p2 = new FootballTeam('Barakat', 29);
// p2.display();
// FootballTeam p3 = new FootballTeam('7adary', 19);
// p3.display();
// FootballTeam p4 = new FootballTeam();
// p4.display();
//  // p1.club = 'el ahly'; // this will throw an error because the variable is private.

// var = condition ? (true): (false)

// --------------------------------------------------------------------

// List <Contact> theContacts = new List <Contact>();

// theContacts = [SELECT Id, Name
// FROM Contact
// WHERE IsDeleted = true
// All ROWS
// ];

// System.debug('Total including deleted: ' + theContacts.size());

// if (!theContacts.isEmpty()) {
//     undelete theContacts;
// }

// --------------------------------------------------------------------
//an Account utility class to create, update and undelete Account records

// public class AccountUtil {

//   public static void createOneAccount(string n, string ph){
//     Account acc = new Account(Name = n, Phone = ph);
//     insert acc;
//     system.debug('ONE Account created');
//   }

//   public static void createMultipleAccounts(integer num, string n, string fx ){
//     List<Account> accounts = new List<Account>();
//     for (integer i = 0; i < num; i++ ) {
//       Account acc = new Account(Name = n + ' ' + i, Fax = fx);
//       accounts.add(acc);
//     }
//     insert accounts;
//     system.debug(num +' Accounts created');
//   }

//   public static void updateAccount(string n, string newN){
//     list <Account> acc = [SELECT Id, Name
//     FROM Account
//     WHERE Name = :n
//     LIMIT 1
//     ];

//     if (acc.isEmpty()) {
//       system.debug('No accounts were found. please douple check the name');
//     }
//     else {
//       acc[0].Name = newN;
//       update acc;
//       system.debug('Account has been updated');
//     }
//   }

//   public static void undeleteAccounts(){
//     list <Account> acc = [SELECT Id, Name
//     FROM Account
//     WHERE IsDeleted = true
//     ALL ROWS
//     ];

//     if(!acc.isEmpty()){
//       undelete acc;
//       system.debug('Account has been restored from recycle bin');
//     }
//   }

//     public static void deleteAll(string n){
//       List <Account> acc = [SELECT Name FROM Account WHERE Name LIKE '%class%'];
//       if (!acc.isEmpty()) {
//         delete acc;
//         system.debug('all your created accounts with this class has been deleted');
//       }
//     }
// }

// using methods fron the above class
// AccountUtil.createOneAccount('created by class', '0115801276');
// AccountUtil.createMultipleAccounts(5, 'created by class', '0115801276');
// AccountUtil.updateAccount('wrong name account', 'ay kalam');
// AccountUtil.updateAccount('wa7ed kaman', 'updated by class');
// AccountUtil.undeleteAccounts();
// AccountUtil.deleteAll('class'); // do not run this line if you want to test the above methods xDDD

// --------------------------------------------------------------------

// example of using Database methods for data manipulation.

// Account acc1 = new Account(Phone= '123456666');
// Account acc2 = new Account(Name = 'database 1', Phone= '123456666');
// Account acc3 = new Account(Name = 'database 2', Phone= '123456666');

// List<Account> accList = new List<Account>{acc1, acc2, acc3};
// // insert accList; // this will throw an error, required field is missing.
// Database.insert(accList, false); // acc2 and acc3 will be added but acc1 will not be added because Name is required field.

// --------------------------------------------------------------------

// example of using Database methods for retreiving the faild data.

// Account acc1 = new Account(Phone= '123456666');
// Account acc2 = new Account(Name = 'database 3', Phone= '123456666');
// Account acc3 = new Account(Name = 'database 4', Phone= '123456666');

// list<Account> accList = new list<Account>{acc1, acc2, acc3};

// // to see the operation log with success and fail records we capture the return in a list with Database.SaveResults method
// list<Database.SaveResult> result = Database.insert(accList, false);

// // displaying the result in a for loop
// for (Database.SaveResult res : result) {
//   // res is an object, you can not access the record fields directly using res.Name to get the account name
//   if (res.isSuccess()) {
//     System.debug('a record was addedd successfully');
//   }
//   else {
//     //loop over errors using Database.Error and getErrors() methods
//     for(Database.Error err: res.getErrors()){
//       system.debug('a record was not addedd due to the below reaosn !!!!!!');
//       system.debug(err.getStatusCode() + ': ' + err.getMessage());
//       System.debug('the below fields caused the problem:');
//       System.debug(err.getFields());
//     }
//   }
// }

// --------------------------------------------------------------------

// Account acc1 = new Account(Name = 'database 5');
// Account acc2 = new Account(Name = 'database 6');
// Account acc3 = new Account();

// List<Account> accList = new List<Account>{acc1, acc2, acc3};

// list<Database.SaveResult> result = Database.insert(accList, false);

// for (Database.SaveResult res : result) {
//   if (res.isSuccess()) {
//     System.debug('record was addedd successfully');
//   }
//   else {
//     for (Database.Error err : res.getErrors()) {
//       System.debug('this record was not added because of the below:');
//       System.debug(err.getStatusCode() + ': ' + err.getMessage());
//       system.debug('the below fields are causing the error: ');
//       System.debug(err.getFields());
//     }
//   }
// }

// --------------------------------------------------------------------

// //* This is a series of 3 tasks related to 1 singe Accont trigger and 1 utility class
// //* creating a trigger that add a contact when an account is created (task 1/3)

// // this part is added to SF UI in the object manager -> triggers -> new trigger
// trigger CreateDummyContact on Account (after insert) {
//   AccountTriggerClassMethods.addContact(Trigger.new);
// }

// // this is the class that contains the methods to handle the methods inside the trigger
// public class AccountTriggerClassMethods {

//   public static void addContact(List<Account> accounts){
//     list<Contact> contacts = new list<Contact>();
//     for (Account acc : accounts) {

//       Contact cont = new Contact(LastName = 'dummy contact', AccountId = acc.Id);
//       contacts.add(cont);
//     }
//     insert contacts;
//   }
// }

// --------------------------------------------------------------------

// //*This is a series of 3 tasks related to 1 singe Accont trigger and 1 utility class
// //* creating a trigger that prevent account deletion if it has a related contact (task 2/3)

// // this part is added to SF UI in the object manager -> triggers -> new trigger
// // NOTE: we modified the preious trigger and class above to handle both last task and this task
// trigger CreateDummyContact on Account (after insert, before delete) {
//   if (Trigger.isAfter) {
//     if (Trigger.isInsert) {
//       // if the context is to insert record, the first task (insert contact) will be executed.
//       AccountTriggerClassMethods.addContact(Trigger.new);
//     }
//   }

//   else if(Trigger.isBefore){
//     if (Trigger.isDelete) {
//       // handling the delete requested task
//       AccountTriggerClassMethods.noDeleteWithContact(Trigger.old);
//     }
//   }
// }

// // this is the class that contains the methods to handle the methods inside the trigger
// public class AccountTriggerClassMethods {
//   // handling the previous add contact task
//   public static void addContact(List<Account> accounts){
//     list<Contact> contacts = new list<Contact>();
//     for (Account acc : accounts) {
//       Contact cont = new Contact(LastName = 'dummy contact', AccountId = acc.Id);
//       contacts.add(cont);
//     }
//     insert contacts;
//   }

//   // handling this task (no delete account if there is a task)
//   public static void noDeleteWithContact(List<Account> accounts){
//       set<Id> idOfAccountsWithContacts = new set<Id>();
//       // this is not bad practice since we used the query as a list to loop over and NOT inside the loop
//       for(Contact cont : [SELECT AccountId FROM Contact WHERE AccountId IN: accounts ]){
//         idOfAccountsWithContacts.add(cont.AccountId); // 20 ID have contacts
//       }

//     for (Account acc : accounts) {
//       if (idOfAccountsWithContacts.contains(acc.Id)) {
//         acc.addError('you can not delet this Account because it has a related Contact - OR, you deactivate the CreateDummyContact trigger');
//       }
//     }
//   }
// }

// --------------------------------------------------------------------

// //*This is a series of 3 tasks related to 1 singe Accont trigger and 1 utility class
// //* creating a trigger that check if address value is blank and fill it before insert (task 3/3)

// // this part is added to SF UI in the object manager -> triggers -> new trigger
// // NOTE: we modified the preious trigger and class above to handle both last task and this task
// trigger CreateDummyContact on Account (after insert, before insert, before delete) {
//   if (Trigger.isAfter) {
//     if (Trigger.isInsert) {
//       // if the context is to insert record, the first task (insert contact) will be executed.
//       AccountTriggerClassMethods.addContact(Trigger.new);
//     }
//   }

//   else if(Trigger.isBefore){
//     if (Trigger.isDelete) {
//       // handling the delete requested task
//       AccountTriggerClassMethods.noDeleteWithContact(Trigger.old);
//     }
//     else if(Trigger.isInsert){
//       // handle the task of filling the address fields if empty
//       AccountTriggerClassMethods.fillAddressIfEmpty(Trigger.new);
//     }
//   }
// }

// // this is the class that contains the methods to handle the methods inside the trigger
// public class AccountTriggerClassMethods {
//   // handling the previous add contact task
//   public static void addContact(List<Account> accounts){
//     list<Contact> contacts = new list<Contact>();
//     for (Account acc : accounts) {
//       Contact cont = new Contact(LastName = 'dummy contact', AccountId = acc.Id);
//       contacts.add(cont);
//     }
//     insert contacts;
//   }

//   // handling previous task (no delete account if there is a task)
//   public static void noDeleteWithContact(List<Account> accounts){
//       set<Id> idOfAccountsWithContacts = new set<Id>();
//       // this is not bad practice since we used the query as a list to loop over and NOT inside the loop
//       for(Contact cont : [SELECT AccountId FROM Contact WHERE AccountId IN: accounts ]){
//         idOfAccountsWithContacts.add(cont.AccountId);
//       }

//     for (Account acc : accounts) {
//       if (idOfAccountsWithContacts.contains(acc.Id)) {
//         acc.addError('you can not delet this Account because it has a related Contact - OR, you deactivate the CreateDummyContact trigger');
//       }
//     }
//   }

//   // handling this task to check if address
// public static void fillAddressIfEmpty(list<Account> accounts) {
//   for (Account acc : accounts) {
//     acc.BillingCity = String.isBlank(acc.BillingCity)
//       ? 'added by trigger'
//       : acc.BillingCity;
//     acc.BillingStreet = String.isBlank(acc.BillingStreet)
//       ? 'trigger street'
//       : acc.BillingStreet;
//     acc.BillingCountry = String.isBlank(acc.BillingCountry)
//       ? 'Angola'
//       : acc.BillingCountry;
//     if (!String.isBlank(acc.Industry) && acc.Industry == 'Media') {
//       acc.Rating = 'Hot';
//     }
//   }
// }
// }

// --------------------------------------------------------------------
// // while creating a case, if the origin is "Email" then status should be "New" and priority "Medium"

// trigger caseTriggers on Case (before insert) {
//   CaseTriggersClassHandler.changeStatus(Trigger.new);
// }

// public class CaseTriggersClassHandler {
// 	public static void changeStatus(list<Case> cases){
//     for (Case cs : cases) {
//       if (cs.Origin == 'Email') {
//         cs.Status = 'New';
//         cs.Priority = 'Medium';
//       }
//     }
//   }
// }

// --------------------------------------------------------------------
// // while creating a Lead, if the lead source is "Web" then Rating should be "Cold" otherwise it should be "Hot"

// trigger LeadTriggers on Lead (before insert){
//   LeadTriggerHandler.changeLeadRating(Trigger.new);
// }

// public class LeadTriggerHandler {
//   public static void changeLeadRating(list<Lead> leads){
//     for (Lead ld : leads) {
//       ld.Rating = ld.LeadSource == 'Web' ? 'Cold' : 'Hot';
//     }
//   }
// }

// --------------------------------------------------------------------
// // Creates the number of contacts which are equal to the number which we will enter in the Number of Locations field on the Account object.
// //* note, I amended the 'addContact' method already existing in the 'AccountTriggerClassMethods' class.

// public static void addContact(List<Account> accounts) {
//   list<Contact> contacts = new List<Contact>();
//   for (Account acc : accounts) {
//     for (Integer i = 0; i < acc.NumberofLocations__c; i++) {
//       Contact cont = new Contact(
//         LastName = acc.Name + ' contact ' + i,
//         AccountId = acc.Id
//       );
//       contacts.add(cont);
//     }
//   }
//   insert contacts;
// }

// --------------------------------------------------------------------
// // Upon Opportunity Creation if Amount is not null and is greater than 100000 then populate 'Hot Opportunity' in description field.

// trigger opportunityTrigger on Opportunity(before insert){
//   OpportunityTriggerHandler.changeDesription(Trigger.new);
// }

// public  class OpportunityTriggerHandler {
//   public static void changeDesription(list<Opportunity> opportunities){
//     for (Opportunity opp : opportunities) {
//       if (opp.Amount > 100000 && opp.Amount != null) {
//         opp.Description = 'Hot "added by trigger"';
//       }
//     }
//   }
// }

// --------------------------------------------------------------------
// // Upon Creation of Position (Custom Object) if it is a New Position and Open Date, Min Pay & Max Pay are not populated then populate them with below values:  Open Date = Today's Date , Max Pay = 15000 , Min Pay = 10000

// trigger positionTrigger on Position__c (before insert) {
//   PositionTriggerHandler.fillValues(Trigger.new);
// }

// public class PositionTriggerHandler{
//   public static void fillValues(list<Position__c> positions){
//     for (Position__c pso : positions) {
//       if (pso.new_position__c == 'New' && pso.Open_Date__c == null && pso.Min_Pay__c == null && pso.Max_Pay__c == null) {
//         pso.Open_Date__c = Date.today();
//         pso.Max_Pay__c = 15000;
//         pso.Min_Pay__c = 10000;
//       }
//     }
//   }
// }

// --------------------------------------------------------------------
// // Account records should have a field named 'Recent Opportunity Amount'. It should contain the opportunity amount of the latest created opportunity on account.

// trigger opportunityTrigger on Opportunity(before insert, after insert){
//   if (Trigger.isBefore) {
//     if (Trigger.isInsert) {
//         OpportunityTriggerHandler.changeDesription(Trigger.new);
//     }
//   }

//   if (Trigger.isAfter) {
//     if (Trigger.isInsert) {
//       OpportunityTriggerHandler.manipulateAccount(Trigger.new);
//     }
//   }
// }

// public  class OpportunityTriggerHandler {
//   public static void changeDesription(list<Opportunity> opportunities){
//     for (Opportunity opp : opportunities) {
//       if (opp.Amount > 100000 && opp.Amount != null) {
//         opp.Description = 'Hot "added by trigger"';
//       }
//     }
//   }

//   public static void manipulateAccount(list<Opportunity> opportunities ){
//     List<Account> accounts = new List<Account>();
//     for (Opportunity opp : opportunities) {
//       Account acc = new Account(Id = opp.AccountId, Recent_Opp_Amount__c = opp.Amount);
//       accounts.add(acc);
//     }
//     update accounts;
//   }
// }

// --------------------------------------------------------------------
// // When a Case is created on any Account, put the latest case number on the Account in the 'Latest Case Number' field.

// trigger caseTriggers on Case (before insert, after insert) {
//   if(Trigger.isBefore){
//     if(Trigger.isInsert){
//       CaseTriggersClassHandler.changeStatus(Trigger.new);
//     }
//   }

//   if(Trigger.isAfter){
//     if(Trigger.isInsert){
//       CaseTriggersClassHandler.updateRelatedAccount(Trigger.new);
//     }
//   }
// }

// public class CaseTriggersClassHandler {
// 	public static void changeStatus(list<Case> cases){
//     for (Case cs : cases) {
//       if (cs.Origin == 'Email') {
//         cs.Status = 'New';
//         cs.Priority = 'Medium';
//       }
//     }
//   }

//   public static void updateRelatedAccount(List<Case> cases){
//     List<Account> accounts = new List<Account>();
//     for (Case cs : cases) {
//       Account acc = new Account(Id = cs.AccountId, Latest_Case_Number__c = cs.CaseNumber);
//       accounts.add(acc);
//     }
//     update accounts;
//   }
// }

// --------------------------------------------------------------------
// // On Account create two checkbox fields labeled as Contact and Opportunity. When a new Account is created and if a particular Contact or Opportunity checkbox is checked then create that related record. Also, Opportunity record should be created only if the Account Active picklist is populated with a yes.

// public static void addRelatedRecords(List<Account> accounts) {
//   list<Contact> contacts = new List<Contact>();
//   list<Opportunity> opportunities = new List<Opportunity>();
//   for (Account acc : accounts) {
//     if (acc.Create_Contact__c) {
//       Contact cont = new Contact(
//         AccountId = acc.Id,
//         LastName = 'create contact checked'
//       );
//       contacts.add(cont);
//     }

//     if (acc.Create_Opportunity__c) {
//       Opportunity opp = new Opportunity(
//         AccountId = acc.Id,
//         Name = 'create opportunity checked',
//         StageName = 'Prospecting',
//         CloseDate = Date.today()
//       );
//       opportunities.add(opp);
//     }
//   }
//   if (!contacts.isEmpty()) {
//     insert contacts;
//   }

//   if (!opportunities.isEmpty()) {
//     insert opportunities;
//   }
// }

// --------------------------------------------------------------------
// // If the Account phone is updated then populate below message in description. Description = Phone is Updated! Old Value : XXX & New Value : XXX

// public static void phoneHistory(
//   List<Account> accounts,
//   Map<Id, Account> oldAccounts
// ) {
//   for (Account acc : accounts) {
//     Account oldAcc = oldAccounts.get(acc.Id);
//     if (acc.Phone != oldAcc.Phone) {
//       acc.Description =
//         'Phone is Updated! Old Value : ' +
//         oldAcc.Phone +
//         ' & New Value : ' +
//         acc.Phone;
//     }
//   }
// }

// --------------------------------------------------------------------
// // If the Account phone is updated then populate the phone number on all related Contacts (Home Phone field). [Using Parent-Child SOQL]
//! important task (parent.child list (ex: acc : acc.Contacts))

// // create the method
// public static void updateContacts(
//   List<Account> accounts,
//   Map<Id, Account> oldAccounts
// ) {
//   // set to collect Account IDs and List to collect Related contacts that will be Updated.
//   Set<Id> updatedAccounts = new Set<Id>();
//   List<Contact> contactsToUpdate = new List<Contact>();

//   // collect the account ID with actual phoen updated
//   for (Account acc : accounts) {
//     Account oldAcc = oldAccounts.get(acc.Id);
//     if (acc.Phone != oldAcc.Phone) {
//       updatedAccounts.add(acc.Id);
//     }
//   }

//   // collect the related contacts for these accounts
//   List<Account> relatedContacts = [
//     SELECT
//       Id,
//       Phone,
//       (
//         SELECT Id, HomePhone
//         FROM Contacts
//       )
//     FROM Account
//     WHERE Id IN :updatedAccounts
//   ];

//   // update the home phone field value of these contacts
//   for (Account acc : relatedContacts) {
//     for (Contact cont : acc.Contacts) {
//       cont.HomePhone = acc.Phone;
//       contactsToUpdate.add(cont);
//     }
//   }
//   // update the contacts (DML)
//   update contactsToUpdate;
// }

// --------------------------------------------------------------------
// // If the Account billing address is updated then update related contacts mailing address. [Using Parent-Child SOQL]
//! important task (the address code / country trick)

// // create the method
// public static void updateContactsMailingAddress(
//   List<Account> accounts,
//   Map<Id, Account> oldAccounts
// ) {
//   // set to collect Account IDs and List to collect Related contacts that will be Updated.
//   Set<Id> updatedAccounts = new Set<Id>();
//   List<Contact> contactsToUpdate = new List<Contact>();

//   // collect the account ID with actual phoen updated
//   for (Account acc : accounts) {
//     Account oldAcc = oldAccounts.get(acc.Id);
//     if (
//       acc.BillingCity != oldAcc.BillingCity ||
//       acc.BillingCountry != oldAcc.BillingCountry ||
//       acc.BillingStreet != oldAcc.BillingStreet ||
//       acc.BillingState != oldAcc.BillingState ||
//       acc.BillingPostalCode != oldAcc.BillingPostalCode ||
//       acc.BillingCountryCode != oldAcc.BillingCountryCode ||
//       acc.BillingStateCode != oldAcc.BillingStateCode
//     ) {
//       updatedAccounts.add(acc.Id);
//     }
//   }

//   if (updatedAccounts.isEmpty()) {
//     return;
//   }

//   // collect the related contacts for these accounts
//   List<Account> relatedContacts = [
//     SELECT
//       Id,
//       BillingCity,
//       BillingCountry,
//       BillingStreet,
//       BillingState,
//       BillingPostalCode,
//       BillingCountryCode,
//       BillingStateCode,
//       (
//         SELECT
//           Id,
//           MailingCity,
//           MailingCountry,
//           MailingStreet,
//           MailingState,
//           MailingPostalCode,
//           MailingCountryCode,
//           MailingStateCode
//         FROM Contacts
//       )
//     FROM Account
//     WHERE Id IN :updatedAccounts
//   ];

//   // update the home phone field value of these contacts
//   for (Account acc : relatedContacts) {
//     for (Contact cont : acc.Contacts) {
//       cont.MailingCity = acc.BillingCity;
//       cont.MailingCountry = acc.BillingCountry;
//       cont.MailingStreet = acc.BillingStreet;
//       cont.MailingState = acc.BillingState;
//       cont.MailingPostalCode = acc.BillingPostalCode;
//       cont.MailingCountryCode = acc.BillingCountryCode;
//       cont.MailingStateCode = acc.BillingStateCode;
//       contactsToUpdate.add(cont);
//     }
//   }
//   // update the contacts (DML)
//   update contactsToUpdate;
// }

// --------------------------------------------------------------------
// // When an account inserts and CopyBilling ToShipping (Custom Field) checkbox is checked then automatically copy account billing address into account shipping address.
//! important task (the address code / country trick)

// public static void fillAddressIfEmpty(list<Account> accounts) {
//   for (Account acc : accounts) {
//     acc.BillingCity = String.isBlank(acc.BillingCity)
//       ? 'added by trigger'
//       : acc.BillingCity;
//     acc.BillingStreet = String.isBlank(acc.BillingStreet)
//       ? 'trigger street'
//       : acc.BillingStreet;
//     if (
//       String.isBlank(acc.BillingCountry) &&
//       String.isBlank(acc.BillingCountryCode)
//     ) {
//       acc.BillingCountry = 'Angola';
//     }
//     if (!String.isBlank(acc.Industry) && acc.Industry == 'Media') {
//       acc.Rating = 'Hot';
//     }
//     if (acc.CopyBilling_ToShipping__c) {
//       acc.ShippingCity = acc.BillingCity;
//       acc.ShippingStreet = acc.BillingStreet;
//       acc.ShippingCountry = acc.BillingCountry;
//       acc.ShippingCountryCode = acc.BillingCountryCode;
//     }
//   }
// }

// --------------------------------------------------------------------
// // When a Opportunity Stage (field) is changed, create a Task record on Opportunity and assign it to Logged In User / Opportunity Owner / Any User.
//! important task (using the Task Object)

// public static void createTask(
//   List<Opportunity> opportunities,
//   Map<Id, Opportunity> oldOpportunities
// ) {
//   List<Task> createdTasks = new List<Task>();

//   // Single loop: check for stage change and create Task directly
//   for (Opportunity opp : opportunities) {
//     Opportunity oldOpp = oldOpportunities.get(opp.Id);

//     if (opp.StageName != oldOpp.StageName) {
//       createdTasks.add(
//         new Task(
//           WhatId = opp.Id,
//           Status = 'Not Started',
//           Subject = 'Stage Changed to: ' + opp.StageName,
//           OwnerId = UserInfo.getUserId() // this will assign the logged in user
//           //OwnerId = opp.OwnerId // this will assign the opportunity owner
//         )
//       );
//     }
//   }

//   // Guard clause: perform DML only if tasks were generated
//   if (!createdTasks.isEmpty()) {
//     insert createdTasks;
//   }
// }

// --------------------------------------------------------------------
// // Write a trigger on Account when Account Active field is updated from 'yes' to 'No' then check all opportunities associated with the account. Update all Opportunities Stage to close lost if stage not equal to close won.

// public static void closeRelatedOpportunities(
//   List<Account> accounts,
//   map<Id, Account> oldAccounts
// ) {
//   set<Id> updatedAccounts = new Set<Id>();

//   for (Account acc : accounts) {
//     Account oldAcc = oldAccounts.get(acc.Id);
//     if (acc.Active__c == 'No' && oldAcc.Active__c == 'Yes') {
//       updatedAccounts.add(acc.Id);
//     }
//   }

//   if (updatedAccounts.isEmpty()) {
//     return;
//   }

//   List<Opportunity> relatedOpps = [
//     SELECT Id, StageName
//     FROM Opportunity
//     WHERE
//       AccountId IN :updatedAccounts
//       AND StageName != 'Closed Won'
//       AND StageName != 'Closed Lost'
//   ];

//   for (Opportunity opp : relatedOpps) {
//     opp.StageName = 'Closed Lost';
//   }

//   if (!relatedOpps.isEmpty()) {
//     update relatedOpps;
//   }
// }

// --------------------------------------------------------------------
// // Apply validation using addError() method in trigger. While Creation of Opportunity is Amount is null then throw an error message.
//* Note, I will update an existing method in the class that handle also something related to the amount

// public static void changeDesription(list<Opportunity> opportunities) {
//   for (Opportunity opp : opportunities) {
//     if (opp.Amount == null) {
//       opp.addError('please fill the amount field');
//     } else if (opp.Amount > 100000) {
//       opp.Description = 'Hot "added by trigger"';
//     }
//   }
// }

// --------------------------------------------------------------------
// // When an opportunity is updated to Closed Lost and Closed Lost Reason (field) is not populated then throw validation error that 'Please populate Closed Lost Reason' on opportunity. [before update]

// public static void checkReason(
//   List<Opportunity> opportunities,
//   map<Id, Opportunity> oldOpps
// ) {
//   for (Opportunity opp : opportunities) {
//     Opportunity oldOp = oldOpps.get(opp.Id);
//     if (
//       oldOp.StageName != 'Closed Lost' &&
//       opp.StageName == 'Closed Lost' &&
//       String.isBlank(opp.Closed_lost_reason__c)
//     ) {
//       opp.Closed_lost_reason__c.addError( // this will add the error message on the field itself
//         'you must fill the rejection reason field if opportunity is closed lost'
//       );
//       // opp.addError( // this will add the error message on the page
//       //   'you must fill the rejection reason field if opportunity is closed lost'
//       // );
//     }
//   }
// }

// --------------------------------------------------------------------
// // Write a trigger on Account and check only System Administrator profile users should be able to delete an account.

// public static void onlyAdmins(List<Account> accounts) {
//   // getting the ID of the user's profile
//   Id userProfileId = UserInfo.getProfileId();

//   // getting the *record* of the user's profle from the profile object
//   Profile userProfileName = [
//     SELECT NAME
//     FROM Profile
//     WHERE Id = :userProfileId
//     LIMIT 1
//   ];

//   if (userProfileName.Name != 'System Administrator') {
//     for (Account acc : accounts) {
//       acc.addError(
//         'only admins can delete accounts ... ama tekbar eb2a garab tani.'
//       );
//     }
//   }
// }

// --------------------------------------------------------------------
// // If an opportunity is closed then, no one should be able to delete it except the user having a System Administrator profile.
//! important task (using user.info class + using .IsClosed())

// public static void onlyAdminCanChange(List<Opportunity> opportunity) {
//   // get the user profile record

//   Profile userProfileRecord = [
//     SELECT NAME
//     FROM Profile
//     WHERE Id = :UserInfo.getProfileId()
//     LIMIT 1
//   ];
//   // check if user is admin ?
//   Boolean isAdmin = (userProfileRecord.Name == 'System Administrator');

//   // if user is admin and opp was close then can edit
//   for (Opportunity opp : opportunity) {
//     if (!isAdmin && opp.IsClosed) {
//       opp.addError('ama tekbar w teb2a ADMIN eb2a ta3ala');
//     }
//   }
// }

// --------------------------------------------------------------------
// // When the Employee record is deleted then update 'Left Employee Count' on Account.
//* this will be an After Delete trigger event because validation rules comes after the 'before triggers' in the order of execution.
//! important task (using map)

// public static void removedEmployees(list<Employee__c> employees) {
//   //create a map to collect account Ids (key) and count of left employees (value)
//   Map<Id, Integer> countOfDeletedEmployees = new Map<Id, Integer>();

//   //loop over employees and update account Ids with number of left employees
//   for (Employee__c emp : employees) {
//     if (emp.Account__c != null) {
//       Integer currentCount = countOfDeletedEmployees.containsKey(emp.Account__c)
//         ? countOfDeletedEmployees.get(emp.Account__c)
//         : 0;

//       countOfDeletedEmployees.put(emp.Account__c, currentCount + 1);
//     }
//   }

//   // early return if map is empty
//   if (countOfDeletedEmployees.isEmpty()) {
//     return;
//   }

//   // query to get related accounts with Left_Employee_Count__c
//   list<Account> accounts = [
//     SELECT Id, Left_Employee_Count__c
//     FROM Account
//     WHERE Id IN :countOfDeletedEmployees.keySet()
//   ];

//   // loop over related accounts to update Left_Employee_Count__c with new value
//   for (Account acc : accounts) {
//     Decimal previousLeft = acc.Left_Employee_Count__c == null
//       ? 0
//       : acc.Left_Employee_Count__c;
//     acc.Left_Employee_Count__c =
//       previousLeft + countOfDeletedEmployees.get(acc.Id);
//   }
//   update accounts;
// }

// --------------------------------------------------------------------
// // When the Employee record is inserted, deleted and undeleted then update 'Present Employee Count' on related Account. [Parent-Child SOQL]

// //* the insert and undelete version.
// //? NOTE: this code have a rist to hit the query row limit for the child subquery (50,000). Hence, I will provide another code using {{{{Aggregate SOQL Query}}}}
//! important (used {{{{Aggregate SOQL Query}}}} )

// public static void addedEmployee(List<Employee__c> employees) {
//   Set<Id> accountIds = new Set<Id>();

//   for (Employee__c emp : employees) {
//     if (!String.isBlank(emp.Account__c)) {
//       accountIds.add(emp.Account__c);
//     }
//   }

//   if (accountIds.isEmpty()) {
//     return;
//   }

//   List<Account> accounts = [
//     SELECT Id, Present_Employee_Count__c, (SELECT Id FROM Employees__r)
//     FROM Account
//     WHERE Id IN :accountIds
//   ];

//   for (Account acc : accounts) {
//     acc.Present_Employee_Count__c = acc.Employees__r.size();
//   }

//   update accounts;
// }

// //* EX: using {{{{Aggregate SOQL Query}}}}:
// public static void presentEmployees(List<Employee__c> employees) {
//     Set<Id> accountIds = new Set<Id>();

//     for (Employee__c emp : employees) {
//         if (emp.Account__c != null) {
//             accountIds.add(emp.Account__c);
//         }
//     }

//     if (accountIds.isEmpty()) {
//         return;
//     }

//     // Aggregate query returns only 1 row per Account, ignoring child record limits
//     List<AggregateResult> results = [
//         SELECT Account__c accId, COUNT(Id) totalCount
//         FROM Employee__c
//         WHERE Account__c IN :accountIds
//         GROUP BY Account__c
//     ];

//     List<Account> accountsToUpdate = new List<Account>();

//     for (AggregateResult ar : results) {
//         Id accId = (Id) ar.get('accId');
//         Integer totalCount = (Integer) ar.get('totalCount');

//         accountsToUpdate.add(new Account(
//             Id = accId,
//             Present_Employee_Count__c = totalCount
//         ));
//     }

//     if (!accountsToUpdate.isEmpty()) {
//         update accountsToUpdate;
//     }
// }

// --------------------------------------------------------------------
// // Upon contact creation an email should be sent to email populated on Contact with specified template.

// public class ContactTriggerHandler {
//   public static void sendEmail(List<Contact> contacts) {
//     // hardcoded IDs should ideally be retrieved dynamically or via Custom Settings/Metadata
//     List<EmailTemplate> template = [
//       SELECT Id
//       FROM EmailTemplate
//       WHERE DeveloperName = 'Trigger_Email_Template'
//     ];

//     Id templateId = template[0].Id;

//     List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

//     for (Contact cont : contacts) {
//       // Ensure Contact has an ID (after insert) and an Email address
//       if (cont.Id != null && String.isNotBlank(cont.Email)) {
//         Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

//         // setTargetObjectId automatically sets the recipient to cont.Email and binds template merge fields
//         message.setTargetObjectId(cont.Id);
//         message.setTemplateId(templateId);
//         message.setSaveAsActivity(true);

//         emails.add(message);
//       }
//     }

//     // Send the list of emails in a single bulkified call
//     if (!emails.isEmpty()) {
//       Messaging.sendEmail(emails);
//     }
//   }
// }

// --------------------------------------------------------------------
// // number of Partner Case or Customer Case on Account object. Create Custom Fields on Account to have total numbers.
