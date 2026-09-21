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


