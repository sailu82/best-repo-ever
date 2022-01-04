public with sharing class AccountControllerCls {
    @AuraEnabled
    public static list<Account> getAccountById(Id accId){
        return [select id,name, phone from Account where Id=:accId];
    }
    
    @AuraEnabled(cacheable=true)
       public static list<account> getAcc(){
        return [SELECT Id, Name, Type, Rating,
                Phone, Website, AnnualRevenue
            FROM Account limit 15];
    }
    @AuraEnabled(cacheable=true)
        public static List<Opportunity> getOpp(){
            return [select id,Name,StageName,CloseDate from Opportunity limit 10];
        }
    }