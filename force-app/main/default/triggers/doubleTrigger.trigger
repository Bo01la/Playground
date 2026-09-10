trigger doubleTrigger on Opportunity (before Insert, before Update) {

    for(Opportunity record: Trigger.new){
    // fire the Before Insert when we create the record
        if(Trigger.isInsert){
        record.Description = 'this record was created by the Insert trigger';
        }
        // fire the Before Update when we update the record
        else {
        record.Description= 'this record was updated by the Update trigger in the esle block';
        }
    
    }

}