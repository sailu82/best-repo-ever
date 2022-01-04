public class contactcls1 {
    public list<contact> contList{get;set;}
    public list<SelectOption> actName{get;set;}
    public string selectedAcc{get;set;}
    public contactcls1(){
      contList =new list<contact>();
        actName = new list<SelectOption>();
        Selectoption selectop1 = new SelectOption('', '---None---');
        actName.add(selectop1);
        for(Account acc:[select id, name from Account limit 10]){
        actName.add(new Selectoption(acc.Id, acc.Name));
    }
}
   public pageReference retrieveRec(){
    if(selectedAcc!=''){
      contList =[select id,name, email from contact where accountId=:selectedAcc];  
    }
    return null;
}
    

}