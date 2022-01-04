public class leadcls1 {
     public Lead leadObj{get;set;}
    public leadcls1(){
        leadObj =new Lead();
    }
    public pageReference savelead(){
        insert leadObj;
        return new pageReference('/'+leadObj.Id);
    }

}