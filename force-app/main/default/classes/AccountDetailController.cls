public with sharing class AccountDetailController {
    @AuraEnabled
    public static list<Account> getAccountDetails(){
      list<Account> lstOfAccounts = new list<Account>();
        try{
            for(Account accObject : [Select Id,Name,Phone,Rating,Industry from Account where Rating != null]){
                lstOfAccounts.add(accObject);   
            }
        } catch (Exception e)
        {
            throw new AuraHandledException(e.getMessage());
        }
        return lstOfAccounts;
    }
@AuraEnabled
    public static list<Contact> getContacts(Id recordId){
        list<Contact> lstOfContacts = new list<Contact>();
        try{
            for(Contact contactObj : [Select Id,FirstName,LastName, Email,Phone from Contact where AccountId =: recordId]){
                lstOfContacts.add(contactObj);
            
            }
        }catch (Exception e){
            throw new AuraHandledException (e.getMessage());
        }
        return lstOfContacts;
        }
    }