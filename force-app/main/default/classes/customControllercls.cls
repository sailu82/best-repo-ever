public class customControllercls {
    public College__c cObj{get;set;}
    public customControllercls()
    {
        cObj = new College__c();
    }
    public PageReference saveCollDetails(){
        insert cObj;
        PageReference pageRef = new PageReference('/'+cObj.Id);
        return pageref;
    }
    public PageReference cancel1(){
        
        PageReference pageRef = ApexPages.currentPage();
        return pageref;
    }

}