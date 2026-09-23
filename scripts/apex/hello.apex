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

// this part is added to SF UI in the object manager -> triggers -> new trigger 
// NOTE: we modified the preious trigger and class above to handle both last task and this task
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
//         idOfAccountsWithContacts.add(cont.AccountId);
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
//   public static void fillAddressIfEmpty(list<Account> accounts){
//     for (Account acc : accounts) {
//       acc.BillingCity = String.isBlank(acc.BillingCity) ? 'added by trigger' : acc.BillingCity;
//       acc.BillingStreet = String.isBlank(acc.BillingStreet) ? 'trigger street' : acc.BillingStreet;
//       acc.BillingCountry = String.isBlank(acc.BillingCountry) ? 'Angola' : acc.BillingCountry;
//     }
//   }
// }
