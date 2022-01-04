public class insertAccountList {
    public void insertRecords(){
        List<Account> lstofAccounts = new List<Account>(); 
       Account objAcc;
       objAcc = new Account(Name='TestAccount0', Phone= '1241231231', Rating= 'Hot', Description= 'Test Desription',Account_Inserted__c= TRUE); 
       lstofAccounts.add(objAcc);
        objAcc = new Account(Name='TestAccount2', Phone= '1111111111', Rating= 'Cold', Description= 'Test Desription1',Account_Inserted__c= FALSE); 
       lstofAccounts.add(objAcc);
        objAcc = new Account(Name='TestAccount3', Phone= '2222222222', Rating= 'Warm', Description= 'Test Desription2',Account_Inserted__c= TRUE); 
       lstofAccounts.add(objAcc);
        objAcc = new Account(Name='TestAccount4', Phone= '3333333333', Rating= 'Hot', Description= 'Test Desription3',Account_Inserted__c= TRUE); 
       lstofAccounts.add(objAcc);
        objAcc = new Account(Name='TestAccount5', Phone= '444444444', Rating= 'Warm', Description= 'Test Desription4',Account_Inserted__c= TRUE); 
       lstofAccounts.add(objAcc);
       insert lstofAccounts;
    }
    }