/********************************************************************
@ClasName : AnonymizeData
@Author   : Sailaja
@Date     : 25/02/2020
@Description : This class is used to anonymize account and address
*********************************************************************/
public class AnonymizeData implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext ctx){
        return Database.getQueryLocator([SELECT Id,Name,SSN__c ,First_Name__c FROM AccountP__c]);
    }

    public void execute(Database.BatchableContext bc, List<AccountP__c> lstOfAccounts){
        List<AccountP__c> lstOfAccsToUpdate = new List<AccountP__c>();
        List<Address__c> lstOfAddressToUpdate = new List<Address__c>();
        set<Id> setOfAccountIds = new set<Id>();
        for(AccountP__c accRecord:lstOfAccounts){
            setOfAccountIds.add(accRecord.Id);
            accRecord.Name = 'Hi'+accRecord.Name +'Hello';
            accRecord.SSN__c = '9876543219';
            accRecord.First_Name__c= 'TestFirstname';
            lstOfAccsToUpdate.add(accRecord);
        }
        for(Address__c addressObj:[SELECT Id,City__c,Street_Name__c,AccountP__c from Address__c WHERE AccountP__c IN :setOfAccountIds]){
            addressObj.Street_Name__c= 'Testing street name ';
            addressObj.City__c = 'Testing city';
            lstOfAddressToUpdate.add(addressObj);
        }
        if(!lstOfAccounts.isEmpty()){
            update lstOfAccounts;
        }
        if(!lstOfAddressToUpdate.isEmpty()){
            update lstOfAddressToUpdate;
        }
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}