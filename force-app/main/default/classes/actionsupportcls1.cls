public class actionsupportcls1 {
public list<Account> accList{get;set;}
    public list<SelectOption> actName{get;set;}
    public string selectedAcc{get;set;}
    public actionsupportcls1(){
      accList =new list<Account>();
        actName = new list<SelectOption>();
        Selectoption selectop1 = new SelectOption('', '---None---');
        actName.add(selectop1);
        for(Account acc:[select id, name,Phone from Account limit 10]){
        actName.add(new Selectoption(acc.Id, acc.Name));
    }
}
   public pageReference retrieveRec(){
    if(selectedAcc!=''){
      accList =[select id,name,Rating,Phone from Account where Id =:selectedAcc limit 10];  
    }
    return null;
}
}