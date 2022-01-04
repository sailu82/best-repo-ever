public class accRecordClass {
    public static void accRecordMethod(){
        
     list<Account> accList1 = [SELECT Id,Name,Active__c from Account where Active__c ='No' limit 5];
          for(Account ac : accList1)  {
              ac.Name ='testaccountname11';
            ac.Active__c ='Yes'; 
              }
           update accList1;
        system.debug(accList1);
        list<Account> accdeleteList = [SELECT Id,Name,Active__c from Account where Active__c ='No' limit 3 ];            
        delete accdeleteList;
        system.debug('records deleted' +accdeleteList.size());
    
              
          
    }
    
}