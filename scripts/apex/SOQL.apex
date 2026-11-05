// //* Some useful closures in SOQL
// // NULL LAST (make the rows with null values appear in the bottom of the table) -> EX:- ORDER BY Name NULL LAST

// // HAVING (to filter with speciding condition) 
// EX:-
// SELECT AccountId, COUNT(Id) contactCount
// FROM Contact
// WHERE AccountId != null
// GROUP BY AccountId
// HAVING COUNT(Id) >= 5 // must be after GROUP BY
// ORDER BY COUNT(Id) DESC
// LIMIT 20




// //* 1- Date Laterals

// // Common date literals:

// // TODAY

// // THIS_WEEK

// // LAST_N_DAYS:n  - the past n days (including today)

// // NEXT_N_DAYS:n  - the next n days

// // LAST_MONTH

// // YESTERDAY

// // LAST_WEEK

// // NEXT_MONTH

// // TOMORROW

// // NEXT_WEEK

// // THIS_MONTH

// // LAST_QUARTER

// public class LeadQueryService {
//   public static List<Lead> getRecentLeads() {
//     return [
//       SELECT Id, FirstName, LastName, CreatedDate
//       FROM Lead
//       WHERE CreatedDate >= LAST_N_DAYS:30 // retrieve records in last 30 days including today
//       WITH SECURITY_ENFORCED // like with sharing in classes --> it helps tp apply FLS and CRUD
//       ORDER BY CreatedDate DESC
//       LIMIT 200
//     ];
//   }
// }

//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? another example:
// public class UpcomingOpportunitiesQuery {

//     public static List<Opportunity> getOpportunitiesClosingNext7Days() {
//     return [SELECT CloseDate
// FROM Opportunity
// WHERE CloseDate = NEXT_N_DAYS: 7
// ORDER BY CloseDate  ASC];
//     }
// }

//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? another example:
// public class CurrentMonthOpportunitiesQuery {
//   public static List<Opportunity> getOpportunitiesThisMonth() {
//     return [
//       SELECT CloseDate
//       FROM Opportunity
//       WHERE CloseDate = THIS_MONTH
//       ORDER BY CloseDate ASC
//     ];
//   }
// }

//!____________________________________________________________________________________________

// //* 2- AggregateResult

//? Compute and return the average Amount of all Closed Won Opportunities as a Decimal. Return 0 if no records exist.

// public class ClosedWonAverageAmountQuery {
//   public static Decimal getAverageClosedWonAmount() {
//     List<AggregateResult> result = [
//       SELECT AVG(Amount) avgAmt
//       FROM Opportunity
//       WHERE StageName = 'Closed Won'
//     ];

//     // Break out the cast and null check into separate steps
//     Decimal avgAmount = (Decimal) result[0].get('avgAmt');

//     if (avgAmount == null) {
//       return 0;
//     }

//     return avgAmount;
//   }
// }

//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Aggregate the Lead object to find the total number of Leads in each Lead Source category, ordered from the most to the least common source.

// public class LeadsBySourceQuery {
//   public static List<AggregateResult> getLeadCountBySource() {
//     return [
//       SELECT LeadSource, COUNT(Id) total
//       FROM Lead
//       GROUP BY LeadSource
//       ORDER BY COUNT(Id) DESC
//     ];
//   }
// }

//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Write a SOQL query using aggregate functions to produce a summary report of Opportunity records grouped by StageName.For each stage, return the count, total amount, and average amount.

// public class OpportunitySummaryService {
//   public static List<AggregateResult> getOpportunitySummary() {
//     return [
//       SELECT StageName, COUNT(Id) cnt, SUM(Amount) totalAmt, AVG(Amount) avgAmt
//       FROM Opportunity
//       GROUP BY StageName
//       ORDER BY COUNT(Id) DESC
//     ];
//   }
// }

//!____________________________________________________________________________________________

//* 3- Semi-joint and anti-joind queries

// //? Write a method that returns all Contact records whose parent Account has at least one Closed Won Opportunity — using a SOQL semi-join (IN with a subquery).

// public class ContactAccountQueryService {
//   public static List<Contact> getContactsAtWinningAccounts() {
//     return [
// SELECT Id, FirstName, LastName, AccountId
// FROM Contact
// WHERE
//   AccountId IN (
//     SELECT AccountId
//     FROM Opportunity
//     WHERE StageName = 'Closed Won'
//         )
//     ];
//   }
// }

//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Write a method that returns all Account records that have no open Cases — using a SOQL anti-join (NOT IN with a subquery).

// public class AccountCaseQueryService {
//   public static List<Account> getAccountsWithNoOpenCases() {
//     return [
//       SELECT Id, Name
//       FROM Account
//       WHERE
//         Id NOT IN (SELECT AccountId FROM Case WHERE Status != 'Closed' AND AccountId != null)
//         ORDER BY Name ASC
//     ];
//   }
// }


//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Write an Apex class InactiveContactFinder with a static method findContactsWithNoActivity() that returns every Contact with zero related Task records (a Task is related to a Contact via its WhoId).


//*The trick is that (WhoId) in the task is a 'polymorphic reference field' meaning that it reference 2 or more different objects (Contacts and Leads in this case). So, we need to filter the WhoIds related to contacts first, then use anti-Joind quiry to get the contacts with no tasks*/



// public class InactiveContactFinder {
//   public static List<Contact> findContactsWithNoActivity() {
//     set<Id> taskIds = new Set<Id>();
//     for (Task t : [
//       SELECT WhoId
//       FROM Task
//       WHERE WhoId != NULL
//     ]) {
//       if (t.getSObjectType() == Contact.SObjectType) {
//         taskIds.add(t.WhoId);
//       }
//     }

//     return [
//       SELECT Id, Name
//       FROM Contact
//       WHERE Id NOT IN :taskIds
//       ORDER BY Name
//     ];
//   }
// }




















//!____________________________________________________________________________________________

//* 4- SOQL Child-to-Parent SOQL (use dot notation) EX:- {Account.Name, Account.Owner.Name}

// //? Write a SOQL query that traverses two levels of parent relationships: Opportunity → Account → Owner.

// SELECT Id, Name, StageName, Amount, Account.Name, Account.Owner.Name
// FROM Opportunity
// WHERE IsClosed = false
// ORDER BY Account.Name ASC
// LIMIT 20


//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Write a child-to-parent query that filters Contacts by their parent Account's Type field.

// SELECT Id, FirstName, LastName, Email, Phone, Account.Type, Account.Name
// FROM Contact
// WHERE Account.Type = 'Customer'
// ORDER BY LastName ASC
// LIMIT 50


//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Write a SOQL query that retrieves Cases with fields from two different parent objects: Contact and Account.

// SELECT Id, CaseNumber, Subject,  Status, Contact.FirstName, Contact.LastName, Contact.Email, Account.Name, Account.Phone
// FROM Case
// WHERE  Status != 'Closed'
// ORDER BY CaseNumber ASC
// LIMIT 20



//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? (Normal child to parent query) ->Sort primarily by the Account's Name, then by the contact's LastName

// /*
// Sorting by two fields works as a primary sort followed by a secondary tie-breaker sort.

// When Salesforce executes this query, it processes the ordering in two steps:

// Primary Sort (Account.Name ASC): The system first arranges all returned records alphabetically by the parent Account's name (A to Z).

// Secondary Sort (LastName ASC): Whenever multiple contacts belong to the exact same Account, Salesforce looks at LastName to decide which contact comes first among that specific group.
// */

// SELECT Id, FirstName, LastName, Email, Phone, Title, Account.Name, Account.Type, Account.BillingCity, Account.Website
// FROM Contact
// WHERE Account.Name != null
// ORDER BY Account.Name ASC, LastName ASC // (we sort by account name 1st then with last name)
// LIMIT 50


//!____________________________________________________________________________________________

//* 4- SOQL Parent-to-Child SOQL (use nested SOQL for child after the 'SELECT')
//* (can be up to 5 cild nested queries and we must use plural 'Contacts' NOT 'Contact') */

// //? Write a parent-to-child query that retrieves Accounts with only the Contact Id in the subquery — the minimal useful subquery pattern.

// SELECT Id, Name, Type,
//     (SELECT Id FROM Contacts) // child query (can be up to 5 and we must use plural 'contactS' NOT 'Contact')
// FROM Account
// WHERE Id IN (SELECT AccountId FROM Contact)
// ORDER BY Name ASC
// LIMIT 20


//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



// //? Retrieve Accounts with a subquery for Contacts that have an email address. Filter and sort within the subquery.


// SELECT Id, Name, Industry,
//     (SELECT Id, FirstName, LastName, Email
//      FROM Contacts
//      WHERE Email != null
//      ORDER BY LastName ASC)
// FROM Account
// ORDER BY Name ASC
// LIMIT 15



//TODO ------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// //? Retrieve Accounts that have open Cases, using a parent-to-child subquery for the cases and a semi-join to filter only accounts with open cases.

// SELECT Id, Name, Phone,
//   (SELECT Id, CaseNumber, Subject, Status, Priority
//     FROM Cases
//     WHERE Status != 'Closed'
//     ORDER BY Priority ASC) // accessing the child records
// FROM Account
// WHERE Id IN (SELECT AccountId FROM Case WHERE Status != 'Closed')
// ORDER BY Name ASC
// LIMIT 10

