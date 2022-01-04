public class healerlogincls {
    
    public AccountP__c acc {get;set;}    
    public healerlogincls()
    {
        acc = new AccountP__c();
    }
    public PageReference save2()
    {
        insert acc;
       PageReference pageRef = new PageReference('/'+acc.Id);
        return pageref; 
    }
	public PageReference cancel()
    {
       PageReference p1 = ApexPages.currentPage();
       return p1;  
    }

}