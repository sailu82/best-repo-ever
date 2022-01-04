public class vfpageControllercls {
    public list<Account> accountList{get;set;}
    public vfpageControllercls(ApexPages.StandardController stdController){
        
        accountList = new list<Account>();
        accountList = [select id,Name, type, rating from Account limit 10];
    }

}