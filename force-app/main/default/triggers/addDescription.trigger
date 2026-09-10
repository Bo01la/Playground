// we must add the trigger name and when we want it to execute
trigger addDescription on Account (before Insert) {
// using enhanced for loop with variable name and (Treigger.new) which creates a list of records that will be created and add the field values in batches
    for(Account record: Trigger.new){
    // clarifying which field will have a new value
    record.Description= 'another description record is fired xD xD';
    }
}