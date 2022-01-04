public class addressCls1 {
    public static void calculateNumberOfContacts(List<AddressP__c> conList)
    {
        set<Id> accountIdSet = new set<Id>();
        Map<Id,AccountP__c> accountMap = new Map<Id,AccountP__c>();
        for(AddressP__c con :conList)
        {
            if(con.AccountP_Name__c!=null)
            {
               accountIdSet.add(con.AccountP_Name__c);          
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0)
        {
            for(AggregateResult agrResult : [Select Count(Id) contCount,AccountP_Name__c
                                             from AddressP__c where AccountP_Name__c IN:accountIdSet Group By AccountP_Name__c])
            {
              AccountP__c acc = new AccountP__c();
                acc.id = (Id)agrResult.get('AccountP_Name__c');
                acc.Number_of_Address__c= (Integer)agrResult.get('contCount');
                accountMap.put(acc.Id,acc);
            }
            if(accountMap!=null && accountMap.size()>0){
                update accountMap.values();
            }
        	}

}
    
    public static void calculateNumberOfContactsDelete(List<AddressP__c> conList)
    {
        set<Id> accountIdSet = new set<Id>();
        Map<Id,AccountP__c> accountMap = new Map<Id,AccountP__c>();
        for(AddressP__c con :conList)
        {
            if(con.AccountP_Name__c!=null)
            {
               accountIdSet.add(con.AccountP_Name__c);
                      
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0)
        {
            for(AggregateResult agrResult : [Select Count(Id) contCount,AccountP_Name__c
                                             from AddressP__c where AccountP_Name__c IN:accountIdSet AND Id not IN:conList Group By AccountP_Name__c])
			{
              AccountP__c acc = new AccountP__c();
                acc.id = (Id)agrResult.get('AccountP_Name__c');
                acc.Number_of_Address__c= (Integer)agrResult.get('contCount');
                accountMap.put(acc.Id,acc);
            }
            if(accountMap!=null && accountMap.size()>0)
            {
                update accountMap.values();
            }
    	}
		}
}