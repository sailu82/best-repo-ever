public with sharing class loginController {
    public String password{ get; set; }
    public String username{ get; set; }
    public Registration__c reg { set; get;}
    public transient String errorMessage { get; set; }
	public List<Registration__c> userlist;

    public loginController(ApexPages.StandardController controller)
     {
       reg =(Registration__c)controller.getRecord();
    }
        public PageReference Signup1(){
        PageReference p = new  PageReference('/apex/HealthVFpage1');
        return p;
    }
     public PageReference Verifyuser()
     {
     try
     {
      List<Registration__c> p1 = new List<Registration__c>(); 
        if(!String.isBlank(username))
        {
            p1 = [SELECT User_Name__c,Password__c FROM Registration__c WHERE User_Name__c =:username LIMIT 1];       
            if(p1.size()>0)
            {
                if(username == p1[0].User_Name__c && password == p1[0].Password__c)
                {
                    PageReference newPage = new PageReference('/apex/HealthVFpage');
                    newPage.setRedirect(true);
                    return newpage;
                }             
            }
            else
            {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Invalid  username and password please check'));
            }
        }
        else
        {
       
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,'Please enter username and password'));
        }
        }
        catch(Exception e)
        {
        }
         
        return null;     
     }


}