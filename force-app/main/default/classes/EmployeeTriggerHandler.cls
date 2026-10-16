public class EmployeeTriggerHandler {
  public static void removedEmployees(list<Employee__c> employees) {
    //create a map to collect account Ids (key) and count of left employees (value)
    Map<Id, Integer> countOfDeletedEmployees = new Map<Id, Integer>();

    //loop over employees and update account Ids with number of left employees
    for (Employee__c emp : employees) {
      if (emp.Account__c != null) {
        Integer currentCount = countOfDeletedEmployees.containsKey(
            emp.Account__c
          )
          ? countOfDeletedEmployees.get(emp.Account__c)
          : 0;

        countOfDeletedEmployees.put(emp.Account__c, currentCount + 1);
      }
    }

    // early return if map is empty
    if (countOfDeletedEmployees.isEmpty()) {
      return;
    }

    // query to get related accounts with Left_Employee_Count__c
    list<Account> accounts = [
      SELECT Id, Left_Employee_Count__c
      FROM Account
      WHERE Id IN :countOfDeletedEmployees.keySet()
    ];

    // loop over related accounts to update Left_Employee_Count__c with new value
    for (Account acc : accounts) {
      Decimal previousLeft = acc.Left_Employee_Count__c == null
        ? 0
        : acc.Left_Employee_Count__c;
      acc.Left_Employee_Count__c =
        previousLeft + countOfDeletedEmployees.get(acc.Id);
    }
    update accounts;
  }

  public static void presentEmployees(List<Employee__c> employees) {
    Set<Id> accountIds = new Set<Id>();

    for (Employee__c emp : employees) {
      if (emp.Account__c != null) {
        accountIds.add(emp.Account__c);
      }
    }

    if (accountIds.isEmpty()) {
      return;
    }

    // Aggregate query returns only 1 row per Account, ignoring child record limits
    List<AggregateResult> results = [
      SELECT Account__c accId, COUNT(Id) totalCount
      FROM Employee__c
      WHERE Account__c IN :accountIds
      GROUP BY Account__c
    ];

    List<Account> accountsToUpdate = new List<Account>();

    for (AggregateResult ar : results) {
      Id accId = (Id) ar.get('accId');
      Integer totalCount = (Integer) ar.get('totalCount');

      accountsToUpdate.add(
        new Account(Id = accId, Present_Employee_Count__c = totalCount)
      );
    }

    if (!accountsToUpdate.isEmpty()) {
      update accountsToUpdate;
    }
  }
}
