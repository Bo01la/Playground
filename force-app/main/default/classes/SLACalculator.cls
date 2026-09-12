public with sharing class SLACalculator {
    
    public class SLAInput {
        @InvocableVariable(required=true label='Start DateTime')
        public DateTime startDateTime;
    }

    @InvocableMethod(label='Calculate SLA Business Hours' description='Adds 48 business hours to the given start date based on org Business Hours.')  
    public static List<DateTime> calculateSLA(List<SLAInput> inputs) {
        List<DateTime> slaDueDates = new List<DateTime>();
        
        // Fetch default Business Hours
        BusinessHours defaultBH = [SELECT Id FROM BusinessHours WHERE IsDefault = true LIMIT 1];
        
        // 16 hours converted to milliseconds (16 * 60 * 60 * 1000)
        Long millisecondsToAdd = 57600000L; 

        for (SLAInput input : inputs) {
            DateTime startDate = input.startDateTime != null ? input.startDateTime : System.now();
            DateTime slaDueDate = BusinessHours.add(defaultBH.Id, startDate, millisecondsToAdd);
            slaDueDates.add(slaDueDate);
        }
        
        return slaDueDates;
    }
}