public class deleteAccountRecords {
    public static void deleteAccList(){
        list<Account> lstofAccounts = [SELECT Id, Name, Rating, Active__c FROM Account where Active__c='No' limit 10];
        for(Account aclist : lstofAccounts){
            system.debug(aclist);
        }
        delete lstofAccounts;
        
    }
    

}