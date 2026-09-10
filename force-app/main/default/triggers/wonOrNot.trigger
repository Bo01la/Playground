trigger wonOrNot on Opportunity (before Update) {
    
    for(Opportunity newOpp: Trigger.new){
    // retriving the old value of the status field using Trigger.oldMap.get() and passing the Id as value to get the correct record.
    Opportunity oldOpp = Trigger.oldMap.get(newOpp.Id);
    
    // take action based on status before and after change
    if(oldOpp.StageName != 'Closed Won' && newOpp.StageName == 'Closed Won'){
            newOpp.isWon__c = true;
        }
        
    else if(oldOpp.StageName == 'Closed Won' && newOpp.StageName == 'Closed Won'){
            newOpp.isWon__c = true;
    }
    else {
            newOpp.isWon__c = false;
    }
    
    }
}