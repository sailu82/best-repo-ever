public class accDuplicateHandler {
    public Static void accDupMethod(list<Account> acc1){
        
        for(Account a : acc1){
            list<Account> acc = [select Id, Name from Account where Name=: a.Name];
            if( acc.size()>0){
                a.Name.addError('you cannot create the duplicate account');
                
            }
            
        }
    }

}