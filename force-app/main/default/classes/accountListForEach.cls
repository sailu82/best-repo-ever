public class accountListForEach {
    @auraEnabled(cacheable=true)
    public static list<account> getAccountList(){
        list<Account> accList=[select id,Name,Phone, rating from Account limit 20 ];
        return accList;
    }

}