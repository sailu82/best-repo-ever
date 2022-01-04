public with sharing class AccountSearchController {
    
@AuraEnabled
public static List<Account> fetchAccounts1(string accountName)
{  
string partialName = '%' + accountName + '%';
List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name like :partialName];
return accounts;


    }
}