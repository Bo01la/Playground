public class OpportunityTriggerHandler {
  public static void changeDesription(list<Opportunity> opportunities) {
    for (Opportunity opp : opportunities) {
      if (opp.Amount == null) {
        opp.addError('please fill the amount field');
      } else if (opp.Amount > 100000) {
        opp.Description = 'Hot "added by trigger"';
      }
    }
  }

  public static void manipulateAccount(list<Opportunity> opportunities) {
    List<Account> accounts = new List<Account>();
    for (Opportunity opp : opportunities) {
      Account acc = new Account(
        Id = opp.AccountId,
        Recent_Opp_Amount__c = opp.Amount
      );
      accounts.add(acc);
    }
    update accounts;
  }

  public static void createTask(
    List<Opportunity> opportunities,
    Map<Id, Opportunity> oldOpportunities
  ) {
    List<Task> createdTasks = new List<Task>();

    // Single loop: check for stage change and create Task directly
    for (Opportunity opp : opportunities) {
      Opportunity oldOpp = oldOpportunities.get(opp.Id);

      if (opp.StageName != oldOpp.StageName) {
        createdTasks.add(
          new Task(
            WhatId = opp.Id,
            Status = 'Not Started',
            Subject = 'Stage Changed to: ' + opp.StageName,
            OwnerId = UserInfo.getUserId() // this will assign the logged in user
            //OwnerId = opp.OwnerId // this will assign the opportunity owner
          )
        );
      }
    }

    // Guard clause: perform DML only if tasks were generated
    if (!createdTasks.isEmpty()) {
      insert createdTasks;
    }
  }

  public static void checkReason(
    List<Opportunity> opportunities,
    map<Id, Opportunity> oldOpps
  ) {
    for (Opportunity opp : opportunities) {
      Opportunity oldOp = oldOpps.get(opp.Id);
      if (
        oldOp.StageName != 'Closed Lost' &&
        opp.StageName == 'Closed Lost' &&
        String.isBlank(opp.Closed_lost_reason__c)
      ) {
        opp.Closed_lost_reason__c.addError(
          'you must fill the rejection reason field if opportunity is closed lost'
        );
      }
    }
  }

  public static void onlyAdminCanChange(List<Opportunity> opportunity) {
    // get the user profile record

    Profile userProfileRecord = [
      SELECT NAME
      FROM Profile
      WHERE Id = :UserInfo.getProfileId()
      LIMIT 1
    ];
    // check if user is admin ?
    Boolean isAdmin = (userProfileRecord.Name == 'System Administrator');

    // if user is admin and opp was close then can edit
    for (Opportunity opp : opportunity) {
      if (!isAdmin && opp.IsClosed) {
        opp.addError('ama tekbar w teb2a ADMIN eb2a ta3ala');
      }
    }
  }
}
