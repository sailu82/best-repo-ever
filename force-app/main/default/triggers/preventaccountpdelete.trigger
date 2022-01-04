trigger preventaccountpdelete on AccountP__c (before delete) {
    for(AccountP__c accountpobj : trigger.old )
    {
        if(accountpobj.Status__c == 'Active')
        {
           accountpobj.adderror('you can not delete this account as status active');
        }
    }

}