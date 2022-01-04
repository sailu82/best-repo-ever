public class datatableClass {
@AuraEnabled
    public static List<Account> fetchAccounts(){
        return [select Id, Name, Rating, Industry, Phone, Site from Account limit 10];
    }
    
}