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

