public class UpdateAccounts1 {

    public void updateAccount()
    {
        list<Account> acctobeUpdated = new list<Account>();
        set<id> accIdset =new set<id>();
        for(Contact con : [select id, Account.Id from Contact where Name LIKE '%Test%' AND Account.id!= NULL])
        {
            if(!accIdset.contains(con.Account.id))
                
            {
                Account acc = new Account();
                acc.id = con.Account.id;
                acc.Rating ='Hot';
               acctobeUpdated.add(acc);
                accIdset.add(con.Account.Id);
            }
        }
        if(acctobeUpdated.isEmpty()){
            update acctobeUpdated;
        }
    }
}