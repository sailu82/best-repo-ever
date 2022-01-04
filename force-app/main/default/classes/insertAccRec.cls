public class insertAccRec {
    public static void createAcc(){
        list<Account> accObj = new list<Account>();
        for(integer i=0; i<=10; i++){
            Account acc = new Account();
            acc.Name = 'Testing79'+string.valueof(i);
            acc.Rating ='Warm';
            acc.Active__c ='No';
            accObj.add(acc);
            
        }
        insert accObj;
    
    }

}