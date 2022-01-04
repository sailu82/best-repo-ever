public class accContactTriggerHandler {
    public static void createAccountContMethod(list<Account> acc1){
        list<Contact> Cont = new list<Contact>();
        for(Account objA: acc1){
            if(objA.Industry == 'Banking'){
                contact contObj = new contact();
                contObj.LastName = objA.Name;
                contObj.Phone = objA.Phone;
                contObj.AccountId = objA.Id;
                
                Cont.add(contObj);
               
            }
        }
       insert Cont;
       
        }
}