@isTest
public class UpdateAccountTest1 {
@isTest
    private static void testUpdateAccount(){
        Account acc = new Account();
        acc.Name='Test Account';
        acc.Rating ='Hot';
        insert acc;
        contact con =new Contact();
        con.FirstName ='test';
        con.LastName ='test';
        con.AccountId =acc.Id;
        insert con;
        UpdateAccounts2.updateAccount();
        Account UpdateAcc = [select id,Rating from Account where id =: acc.Id];
        system.assertEquals('Hot', UpdateAcc.Rating);
    }
}