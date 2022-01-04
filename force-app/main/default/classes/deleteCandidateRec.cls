public class deleteCandidateRec {

    public static void deleteCandiadteMethod(){
        list<Candidate__c> lstCadidate = [SELECT Id,Name, Rejected_Candiadte__c, status__c, Phone__c FROM 
                                          Candidate__c WHERE Rejected_Candiadte__c=TRUE];
        system.debug(lstCadidate); 
        
            delete lstCadidate;
     
    }
}