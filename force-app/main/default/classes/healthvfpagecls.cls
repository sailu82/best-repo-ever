public class healthvfpagecls {
    public AccountP__c a {get; set;}
    public account acc {get; set;}
        public healthvfpagecls (ApexPages.StandardController stdControllers)
    {
        
    } 
    public  PageReference regpage()
    {
     PageReference p = new  PageReference('/apex/HealthVFpage1');
    return p;
    }    
    public PageReference regpage1()
    {
       PageReference p1 = new  PageReference('/apex/LoginHealthVfpage');
       return p1;  
    }
    
    public PageReference regpage2(){
              PageReference p2 = new  PageReference('/apex/healerLogin');
    return p2;
    }
     public PageReference regpage3(){
              PageReference p3 = new  PageReference('/apex/contactusvfpage');
    return p3;
    }
    public PageReference regpage4(){
              PageReference p4 = new  PageReference('http://www.google.com');
    return p4;
    }
    public PageReference sendingEmail() {
		Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
		String[] sendingTo = new String[]{'rsailu1@gmail.com'};
		semail.setToAddresses(sendingTo);
		String[] sendingToBccAdd = new String[]{'rsailu1@gmail.com'};
		semail.setBccAddresses(sendingToBccAdd);
		String[] sendingTocAdd = new String[]{'rsailu1@gmail.com'};
		semail.setCcAddresses(sendingTocAdd);
		semail.setSubject('Single Email message Example');
		semail.setPlainTextBody('Hello!!!!!!!!!!This is a test email to test single email message program');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
		return null;
	}
    
}