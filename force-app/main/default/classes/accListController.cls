public class accListController {
@AuraEnabled
    public static list<Account> getAccList()
    {
      return [select Id,Name,Phone from Account where Phone != null limit 10];  
    }
}