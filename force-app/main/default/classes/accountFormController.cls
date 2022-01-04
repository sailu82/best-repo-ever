public class accountFormController {
@AuraEnabled
    public static list<Account> getAccount(Account acc){
        insert acc;
        return [select id,Name,Phone,AnnualRevenue from Account ];
    }
    @AuraEnabled
    public static list<Customer__c> getCustAccount(Customer__c acc){
        insert acc;
        return [select id,Name__c,Phone_Number__c,Email_Address__c,Aadhar_Number__c from Customer__c ];
    }
}