public class testgov1 {
    public static void test1(){
List<Account> accountList = new List<Account>();
Account accountObject;
for (Integer i = 0; i < 150; i++)
{
    accountObject = new Account();
    accountObject.Name = 'Test ' + i;
    accountList.add(accountObject);
}
insert accountList;

Contact contactObject;
for (Account accountIterator : [SELECT Id, Name FROM Account])
{
    contactObject = new Contact();
    contactObject.AccountId = accountIterator.Id;
    contactObject.LastName = 'Surname ' + accountIterator.Name;
    insert contactObject;
}
    }}