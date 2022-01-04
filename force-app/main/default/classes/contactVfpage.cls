public class contactVfpage {
    public list<contact> contlst{get;set;}
    public contactVfpage(ApexPages.StandardController controller){
    contlst =new list<contact>();       
    contlst = [select id,Name, Phone,Email,Account.Id from contact limit 10];
    }

}