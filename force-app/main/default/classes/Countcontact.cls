public class Countcontact {
    public static void Countcontacts(list<contact> newcontact, list<contact> oldcontact){
        set<id> accids = new set<id>();
        try{
            if(newcontact != null){
                for(contact c:newcontact){
                    if(c.accountId != null){
                        accids.add(c.accountId);  
                    }
                }
            }
            if(oldcontact != null){
                for(contact c1:oldcontact){
                    accids.add(c1.accountId);                  
                }
            }
            
            list<account> acc=[select id, Number_of_Contacts__c,(select id from contacts)from Account where id IN:accids ];
            if(acc !=null){
                for(Account accval:acc){
                    accval.Number_of_Contacts__c=  accval.contacts.size();
                }
            }
            if(!acc.isEmpty()){
                update acc;   
            }
        }
        catch(exception e){
            system.debug('get message'+e.getMessage());
        }
    }
}