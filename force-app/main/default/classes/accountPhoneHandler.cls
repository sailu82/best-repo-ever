public class accountPhoneHandler {
    public static void updatePhoneMethod(list<Account> newAccList, map<id,Account> oldMapAcc1){
      map<id,Account> accid = new Map<id,Account>();
        for(Account a : newAccList){
            Account  oldAcc = oldMapAcc1.get(a.id);
            if(a.Phone != oldAcc.Phone){
               a.Name = a.Name + a.Phone;
           }
        }
        
    }

}