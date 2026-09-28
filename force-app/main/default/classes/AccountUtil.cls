public class AccountUtil {
  public static void createOneAccount(string n, string ph) {
    Account acc = new Account(Name = n, Phone = ph);
    insert acc;
    system.debug('ONE Account created');
  }

  public static void createMultipleAccounts(integer num, string n, string fx) {
    List<Account> accounts = new List<Account>();
    for (integer i = 0; i < num; i++) {
      Account acc = new Account(Name = n + ' ' + i, Fax = fx);
      accounts.add(acc);
    }
    insert accounts;
    system.debug(num + ' Accounts created');
  }

  public static void updateAccount(string n, string newN) {
    list<Account> acc = [
      SELECT Id, Name
      FROM Account
      WHERE Name = :n
      LIMIT 1
    ];

    if (acc.isEmpty()) {
      system.debug('No accounts were found. please douple check the name');
    } else {
      acc[0].Name = newN;
      update acc;
      system.debug('Account has been updated');
    }
  }

  public static void undeleteAccounts() {
    list<Account> acc = [
      SELECT Id, Name
      FROM Account
      WHERE IsDeleted = TRUE
      ALL ROWS
    ];

    if (!acc.isEmpty()) {
      undelete acc;
      system.debug('Account has been restored from recycle bin');
    }
  }

  public static void deleteAll(string n) {
    List<Account> acc = [SELECT Name FROM Account WHERE Name LIKE '%class%'];
    if (!acc.isEmpty()) {
      delete acc;
      system.debug(
        'all your created accounts with this class has been deleted'
      );
    }
  }
}
