// //! NOTE, instead of specifying the type of exception in the (catch) block, you can jsut write the generic (Exception) key word and the system will tell you the type of exception + the error message automatically.

// //* A- Type of exceptions:

// //? 1- DML exception:
// Account acc; // Name is a required field to create an account
// try {
//   acc = new Account(Description = 'description');
//   insert acc;
// } catch (DmlException e) {
//   system.debug('the DML exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 2- List exception:
// List<String> stringList = new List<String>{ 'Apple', 'Banana' };
// try {
//   // Attempting to access an index that is out of bounds
//   String outOfBoundsValue = stringList[5];
// } catch (ListException e) {
//   system.debug('the List exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 3- NullPointer exception:
// String nullString;
// try {
//   // Attempting to call a method on a variable that has not been instantiated
//   Boolean isContains = nullString.contains('test');
// } catch (NullPointerException e) {
//   system.debug('the NullPointer exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 4- Query exception:
// try {
//   // Assigning a query that returns no records to a single sObject variable
//   Contact noContact = [
//     SELECT Id, Name
//     FROM Contact
//     WHERE Name = 'NonExistingName123'
//     LIMIT 1
//   ];
// } catch (QueryException e) {
//   system.debug('the Query exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 5- SObject exception:
// Account testAcc = new Account(Name = 'Test SObject');
// insert testAcc;
// try {
//   // Querying the record but omitting the 'Name' field
//   Account queriedAcc = [SELECT Id FROM Account WHERE Id = :testAcc.Id LIMIT 1];
//   // Attempting to access a field that was not queried in the SELECT statement
//   String accName = queriedAcc.Name;
// } catch (SObjectException e) {
//   system.debug('the SObject exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 6- Math exception:
// Integer a = 10;
// Integer b = 0;
// try {
//   // Attempting to divide a number by zero
//   Integer result = a / b;
// } catch (MathException e) {
//   system.debug('the Math exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 7- Type exception:
// Object stringObject = 'This is a string';
// try {
//   // Attempting an invalid type cast from a String to an Integer
//   Integer intValue = (Integer) stringObject;
// } catch (TypeException e) {
//   system.debug('the Type exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 8- String exception:
// try {
//   // Attempting to assign an invalid string format to a Salesforce ID variable
//   Id invalidId = '12345XYZ';
// } catch (StringException e) {
//   system.debug('the String exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 9- Callout exception:
// try {
//   // Attempting to make an HTTP callout after performing a DML operation in the same transaction
//   insert new Account(Name = 'Test Callout');

//   Http http = new Http();
//   HttpRequest req = new HttpRequest();
//   req.setEndpoint('https://api.example.com');
//   req.setMethod('GET');
//   HttpResponse res = http.send(req);
// } catch (CalloutException e) {
//   system.debug('the Callout exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //Type of exceptions:

// //? 10- Custom exception:
// public class MyCustomException extends Exception {
// }

// try {
//   // Throwing a user-defined custom exception manually
//   throw new MyCustomException('This is a simulated custom error.');
// } catch (MyCustomException e) {
//   system.debug('the Custom exception thrown is: => ' + e.getMessage());
// }

// System.debug('this message will be logged because we used try/catch');

// //--------------------------------------------------------------------------

// //* B- common exceptions methods:

// // ? 1- getCause:
// // Returns the cause of the exception as an exception object.

// // ? 2- getLineNumber:
// // Returns the line number from where the exception was thrown.

// // ? 3- getMessage:
// // Returns the error message that displays for the user.

// // ? 4- getStackTraceString:
// // Returns the stack trace as a string.

// // ? 5- getTypeName:
// // Returns the type of exception, such as DmlException, ListException, MathException, and so on.

// try {
//   lead l = [SELECT Name FROM Lead LIMIT 1];
//   string des = l.description; //throw an exception
// } catch (Exception e) {
//   System.debug('Exception type caught: ' + e.getTypeName());
//   System.debug('Message: ' + e.getMessage());
//   System.debug('Cause: ' + e.getCause());
//   System.debug('Line Number ' + e.getLineNumber());
//   System.debug('Stack trace ' + e.getStackTraceString());
// }
// //--------------------------------------------------------------------------

// //* C- Exceptions methods specific for DML only:
// // //Some exception types, such as DmlException, have specific exception methods that apply to onlythem and aren't common to other exception types:

// // ? 1- getDmlFieldNames(Index of the failed record):
// // Returns the names of the fields that caused the error for the specified failed record.

// // ? 2- getDmlld(Index of the failed record):
// // Returns the ID of the failed record that caused the error for the specified failed record.

// // ? 3- getDmlMessage(Index of the failed record):
// // Returns the error message for the specified failed record.

// // ? 4- getNumDml:
// // Returns the number of failed records.



// // 1. Setup: Insert valid accounts so they generate Salesforce IDs
// Account acc1 = new Account(Name = 'Valid Account 1');
// Account acc2 = new Account(Name = 'Valid Account 2');
// List<Account> accountsToUpdate = new List<Account>{acc1, acc2};
// insert accountsToUpdate;

// // 2. Break the data: Remove the required 'Name' field to intentionally cause a DML exception
// acc1.Name = null;
// acc2.Name = null;

// try {
//   // 3. Attempt to update the broken records
//   update accountsToUpdate;
  
// } catch (DmlException e) {
  
//   // ? 4- getNumDml: Returns the total number of failed records
//   Integer failedRecordsCount = e.getNumDml();
//   System.debug('Total failed records: ' + failedRecordsCount);
  
//   // Loop through all the failed records dynamically
//   for (Integer i = 0; i < failedRecordsCount; i++) {
//     System.debug('--- Error Details for Record at Index ' + i + ' ---');
    
//     // ? 2- getDmlId: Returns the ID of the specific failed record
//     Id failedRecordId = e.getDmlId(i);
//     System.debug('Failed Record ID: => ' + failedRecordId);
    
//     // ? 1- getDmlFieldNames: Returns the fields that caused the error (e.g., 'Name')
//     List<String> failedFields = e.getDmlFieldNames(i);
//     System.debug('Fields causing the error: => ' + failedFields);
    
//     // ? 3- getDmlMessage: Returns the exact error message for this specific record
//     String errorMessage = e.getDmlMessage(i);
//     System.debug('Error Message: => ' + errorMessage);
//   }
// }