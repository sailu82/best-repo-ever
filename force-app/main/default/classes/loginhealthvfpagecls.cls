public class loginhealthvfpagecls {
    public AccountP__c ac {get;set;}
    
    public loginhealthvfpagecls()
    {
        ac = new AccountP__c();
    }
    public PageReference save1()
    {
        insert ac;
       PageReference pageRef = new PageReference('/'+ac.Id);
        return pageref; 
    }
public PageReference cancel()
    {
       PageReference p1 = ApexPages.currentPage();
    return p1;  
    }
}