public class deleteStudentRecords {

    public static void deleteStudentlst(){
        List<AccountP__c> lstaccountp = [SELECT Name, Status__c from AccountP__c where Status__c ='Inactive' limit 10];
    for(AccountP__c accp :lstaccountp)
    {
     system.debug(accp);          
    }
    delete lstaccountp;
    
    }    
}