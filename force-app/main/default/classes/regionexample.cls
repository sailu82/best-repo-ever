public class regionexample {
    public Customer__c cObj{get;set;}
    public string cusNo{get;set;}
    public regionexample(){
        cObj = new Customer__c();
    }
    public pageReference retrievecustRecords()
    {
     cObj = [select id,name,Last_Name__c,Email_Address__c,Phone_Number__c from Customer__c where name=:cusNo];  
    return null;
    }

}