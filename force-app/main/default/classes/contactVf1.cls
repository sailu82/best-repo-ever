public class contactVf1 {

    public list<contact> contlst{get;set;}
    public Account acc {get;set;}
    public Account acc1 {get;set;}
    public contactVf1(ApexPages.StandardController controller){
        acc1 = (Account)controller.getRecord();
        contlst =new list<contact>();
        
    //contlst = [select id,Name, Phone,Email from contact where AccountId =:acc.Id];
    }
    public pageReference save()
    {
        
        acc = [select id from Account where id=:acc1.Id limit 1];
        Id accId = apexpages.currentPage().getParameters().get('Id');
      contact con =new contact();
        con.FirstName ='TEST1';
        con.LastName='test2';
        //con.AccountId = id.accId;
        contlst.add(con);
        insert contlst;
        return null;
        

        
    }
   public pageReference cancel(){  

        pageReference pageRef = ApexPages.currentPage();

        return pageRef; 

    } 

}