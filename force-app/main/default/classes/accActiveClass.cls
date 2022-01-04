public class accActiveClass {
    public static void accActiveMethod(){
        list<Account> acList = [SELECT id,Name, Active__c from Account where CreatedDate= Today limit 20];
        list<Account> updatedacList = new list<Account>();
        Account objAcc = new Account();
        objAcc.Active__c ='Yes';
        objAcc.Name ='TestName99';
        acList.add(objAcc);
        insert objAcc;
        system.debug(acList.size());
        system.debug(objAcc);
        for(Account acc: acList){
            if(acc.Active__c == 'Yes'){
               acc.Active__c = 'No' ;
                updatedacList.add(acc);
            }
        }
        update updatedacList;
        system.debug('list has been updated' +updatedacList); 
      
     /*list<Account> accDelete = [Select Id, Name,Active__c from Account where CreatedDate= Today];
    //system.debug(accDelete);
    delete accDelete;
    system.debug( 'success, '+accDelete.size()+ 'records has been deleted');
    }*/
    }
}