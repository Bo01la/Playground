trigger onDelete on Contact (before Delete) {
    for(Contact c: Trigger.old){
        if(c.accountId == null){
        c.addError('YOU CAN NOT DELETE A CONTACT WITHOUT AN ACCOUNT ATTACHED TO IT');
        }
    }
}