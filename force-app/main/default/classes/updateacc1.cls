public class updateacc1 {
 public static void updateAccountRec(){
        List<Account> Acclist = [select Id, Name, Rating, Active__c From Account limit 40];       
        system.debug(Acclist);
        for(Account acc:Acclist){
            acc.Active__c = 'No';
            acc.Rating ='Warm';
        }
        update Acclist;
        system.debug(Acclist);
    }
}