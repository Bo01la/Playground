// // // A- create a class for the batch apex:-
// //? how to use batch apex:
// //? 1- create a class (<access modifier> <class> <class name> <implements> <Database.Batchable<sObject>>{}
// //? 2- define the start, execute and finish methods

// //* De el BATCH APEX metfara8a --------
// public class <NAME_OF_THE_CLASS> implements Database.Batchable<sObject> {
//   // 1. START METHOD: Retrieve records to process
//   public Database.QueryLocator start(Database.BatchableContext bc) {

//   }

//   // 2. EXECUTE METHOD: Process each chunk of records (the accounts list is passed from the return of the start method)
//   public void execute(Database.BatchableContext bc, List<Account> accounts) {

//   }

//   // 3. FINISH METHOD: Post-batch actions
//   public void finish(Database.BatchableContext bc) {
//   }
// }

// // // B- after creating the class you execute it in the IDE or developer console like this:-
// //? Database.executeBatch( new *name of the class*(), *number of records per batch*);
// Database.executeBatch(new <NAME_OF_THE_CLASS>(), Number of records per batch); // each batch will include 7 records for example

// ________________________________________________________________________________________________________

// //* in this example we are updating the null values of billing addrss in the accounts

// public class UpdateAccountNullAddressBatch implements Database.Batchable<sObject> {
//   // 1. START METHOD: Retrieve records to process
//   public Database.QueryLocator start(Database.BatchableContext bc) {
//     System.debug('in the start phase');

//     String query = 'Select Id,BillingCity,BillingCountry from Account WHERE BillingCountry = null OR BillingCity = null';

//     return Database.getQueryLocator(query);
//   }

//   // 2. EXECUTE METHOD: Process each chunk of records (the accounts list is passed from the return of the start method)
//   public void execute(Database.BatchableContext bc, List<Account> accounts) {
//     System.debug('in the execute phase');
//     for (Account acc : accounts) {
//       if (String.isBlank(acc.BillingCountry)) {
//         acc.BillingCountry = 'Egypt';
//       }
//       if (String.isBlank(acc.BillingCity)) {
//         acc.BillingCity = 'added by batch apex';
//       }
//     }

//     if (!accounts.isEmpty()) {
//       update accounts;
//     }
//   }

//   // 3. FINISH METHOD: Post-batch actions
//   public void finish(Database.BatchableContext bc) {
//     System.debug('ya 7alawa ya wlaaaahhhh');
//   }
// }

// // // B- after creating the class you execute it in the IDE or developer console like this:-
// //? Database.executeBatch( new *name of the class*(), *number of records per batch*);
// Database.executeBatch(new UpdateAccountNullAddressBatch(), 7); // each batch will include 7 records

// ________________________________________________________________________________________________________

/* //* difference between stateful and stateless batch apex

1- Stateless (Default):-
Processes record chunks in isolated transactions where instance variables reset back to initial values before each execute() call. Difference: Data is never retained across batch iterations, minimizing execution overhead. When to Use: Ideal for independent, mass record operations—such as updating field values, bulk deleting records, or syncing data—where each chunk runs completely independently of the others.

2- Stateful:-
Stateful Batch Apex (Database.Stateful): Preserves non-static instance variable values continuously across all execute() calls throughout the entire batch lifecycle. Difference: Serializes and maintains state between chunks, making accumulated data available in subsequent chunks and the finish() method. When to Use: Essential when aggregating metrics across all records (e.g., calculating running totals), counting total successes or failures, collecting error logs across iterations, or sending a single summary notification email at the end. */

//? in short, stateful batch apex is like *state* in react, it preserve previous value and update it during the process.
//! NOTE: We need to add (Database.Stateful) beside the (Database.Batchable<sObject>) after the (implement) key word ... in other word, we are using 2 implementation in the stateful not just one

// // Example of stateful batch apex (we will cont the total number of records updated on different batches in the same batch apex call):-

// global class AccountNumberUpdateBAtch implements Database.Batchable<sObject>,Database.Stateful {
//   integer recordsProcessed = 0;  //!(start number of records = 0)

//   global Database.QueryLocator start(Database.BatchableContext BC) {
//     System.debug('Inside Start method');

//     String query = 'select id,BillingCity, AccountNumber, BillingCountry, BillingStreet, BillingState from Account where accountNumber=\'XXXX\'  ';

//     return Database.getQueryLocator(query);
//   }

//   global void execute(Database.BatchableContext BC, List<Account> accList) {
//     System.debug('Inside Execute method');

//     for (Account acc : accList) {
//       acc.accountNumber = 'AAAA';

//       recordsProcessed = recordsProcessed + 1;
//     }

//     update accList;
//   }

//   global void finish(Database.BatchableContext BC) {
//     System.debug('Inside Finish Method');

//     System.debug('Number of records processed' + recordsProcessed); //!( number of records = 20)
//   }
// }

// Database.executeBatch(new AccountNumberUpdateBAtch(), 5); //!( number of records = 20 even though the 20 records were devided over 5 different batches)

//_______________________________________________________________________
// // another Example of stateful batch apex (we will cont the total number of records updated on different batches in the same batch apex call):-

// public class UpdateAccountNameBatchWithStateful implements Database.Batchable<sObject>,Database.Stateful {
//   Integer numberOfUpdatedRecords = 0;

//   public Database.QueryLocator start(Database.BatchableContext bc) {
//     String query = 'select id,BillingCity, AccountNumber, BillingCountry, BillingStreet, BillingState, Name from Account where BillingCountry = \'Egypt\'';
//     return Database.getQueryLocator(query);
//   }

//   public void execute(Database.BatchableContext bc, List<Account> accounts) {
//     for (Account acc : accounts) {
//       numberOfUpdatedRecords++;
//       acc.Name = 'Batched ' + numberOfUpdatedRecords;
//     }
//     if (!accounts.isEmpty()) {
//             update accounts;
//         }
//   }

//   public void finish(Database.BatchableContext bc) {
//     System.debug('number of updated records is = ' + numberOfUpdatedRecords);
//   }
// }
// // in the IDE or the developer console anonymous apex code we execute the below:
// Database.executeBatch(new UpdateAccountNameBatchWithStateful(), 8);

