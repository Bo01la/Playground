// we created a method to create an Account and 2 leads records
public class addContactAndLead {
    Public Static Void createRecords(String accName, String leadName, String leadCompany){
        Account acc= new Account(name = accName);
        Lead l1 = new Lead(LastName= leadName, Company = leadCompany);
        lead l2 = new Lead(LastName= leadName, Company = 'Medixa');
        Insert acc;
        Insert l1;
        Insert l2;
    }
}