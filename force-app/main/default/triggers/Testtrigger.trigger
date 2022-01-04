trigger Testtrigger on AccountP__c (before insert) {
    for(AccountP__c acc : Trigger.New)
    {
        acc.Description__c ='Test Description';
    }

}