public class regionexamplecls1 {
     public Account acc{get;set;}
    public Boolean showTextbox{get;set;}
     
    public regionexamplecls1(){
        acc = new Account();
        showTextbox = false;
    }
     
    public PageReference priorityChanged(){
        if(acc.CustomerPriority__c == 'High'){
            showTextbox = true;
        }
        else{
            showTextbox = false;
        }
        return null;
    }

}