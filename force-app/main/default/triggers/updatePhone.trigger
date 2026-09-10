// used (before update) to trigger when updating
trigger updatePhone on Contact (before Update) {

    for( Contact c: Trigger.new){
    // SF has a built in class called 'userInfo' which has a method called 'getUserName()' to get the user name .. so we display the user who modified this contact record
    c.Description = 'This contact was updated by => '+ userInfo.getUserName();
    }
}