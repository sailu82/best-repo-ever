public class updateAccountlist {
    public static void updateAccountRecords(){
        List<Account> Acclist = [select Id, Name, AnnualRevenue, Rating From Account where AnnualRevenue>= 5000000];       
        system.debug(Acclist);
        for(Account acc:Acclist){
            acc.Rating = 'Hot';
        }
        update Acclist;
        system.debug(Acclist);
    }
}