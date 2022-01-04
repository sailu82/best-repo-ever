public class numberOfConatcts {
    public static void calculateNumberOfContacts(List<Contact> conList)
    {
        set<Id> accountIdSet = new set<Id>();
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Contact con :conList)
        {
            if(con.AccountId!=null)
            {
               accountIdSet.add(con.AccountId);
                      
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0)
        {
            for(AggregateResult agrResult : [Select Count(Id) contCount,AccountId
                                             from Contact where AccountId IN:accountIdSet Group By AccountId])
            {
              Account acc = new Account();
                acc.id = (Id)agrResult.get('AccountId');
                acc.Number_of_Contacts__c= (Integer)agrResult.get('contCount');
                accountMap.put(acc.Id,acc);
            }
            if(accountMap!=null && accountMap.size()>0){
                update accountMap.values();
            }
    }

}
    
    public static void calculateNumberOfContactsDelete(List<Contact> conList)
    {
        set<Id> accountIdSet = new set<Id>();
        Map<Id,Account> accountMap = new Map<Id,Account>();
        for(Contact con :conList)
        {
            if(con.AccountId!=null)
            {
               accountIdSet.add(con.AccountId);
                      
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0)
        {
            for(AggregateResult agrResult : [Select Count(Id) contCount,AccountId
                                             from Contact where AccountId IN:accountIdSet AND Id not IN:conList Group By AccountId])
            {
              Account acc = new Account();
                acc.id = (Id)agrResult.get('AccountId');
                acc.Number_of_Contacts__c= (Integer)agrResult.get('contCount');
                accountMap.put(acc.Id,acc);
            }
            if(accountMap!=null && accountMap.size()>0){
                update accountMap.values();
            }
    }

}
}