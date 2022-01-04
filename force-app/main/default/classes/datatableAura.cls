public class datatableAura {
@AuraEnabled
    public static list<Account> fetchacc(){
        return [select Id,Name,Phone,Industry,Rating from Account];
    }
}