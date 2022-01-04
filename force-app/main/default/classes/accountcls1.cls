public class accountcls1 {
    public Account actObj{get;set;}
    public accountcls1(){
        actObj =new Account();
    }
    public pageReference saveacc(){
        insert actObj;
        return new pageReference('/'+actObj.Id);
    }

}