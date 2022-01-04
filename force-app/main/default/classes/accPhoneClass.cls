public class accPhoneClass {
    public static void accPhoneMethod(){
        list<Account> accList =[SELECT Id, Name, Phone, Rating FROM Account 
                                WHERE Phone = null];
        list<Account> updateList = new list<Account>();
        system.debug(accList);
        for(Account acc:accList){
            acc.Phone = '9855559999';
            updateList.add(acc);       
        }
        update updateList;
        system.debug(updateList);
    }
}