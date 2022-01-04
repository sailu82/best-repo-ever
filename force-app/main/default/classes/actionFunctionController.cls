public class actionFunctionController {
 public Account acc{get;set;}
    public Boolean showPhone{get;set;}
 
    public actionFunctionController(){
        acc = new Account();
        showPhone = false;
    }
 
    public PageReference priorityChanged(){
        if(acc.Rating == 'Hot'){
            showPhone = true;
        }
        else{
            showPhone = false;
        }
        return null;
    }
}