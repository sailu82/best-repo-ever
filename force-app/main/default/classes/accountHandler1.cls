public class accountHandler1 {
	public Static void accDupMethod(list<Account> acc1)
    {
           for(Account a : acc1)
           {
            	list<Account> acc = [select Id, Name from Account where Name=: a.Name];
            	if( acc.size()>0)
                {
                	a.Name.addError('you cannot create the duplicate account');   
            	}           
        	}
	}
    public static void updatePhoneMethod(list<Account> newAccList, map<id,Account> oldMapAcc1)
    {
         map<id,Account> accid = new Map<id,Account>();
         for(Account a : newAccList)
         {
            Account  oldAcc = oldMapAcc1.get(a.id);
            if(a.Phone != oldAcc.Phone)
            {
               a.Name = a.Name + a.Phone;
           }
        }
        
    }
    public static void createAccountMethod(list<Account> acc)
    {
           list<Account> a = new list<Account>();
             for(Account objac : acc)
        { 
                objac.ShippingState = objac.BillingState;
                objac.ShippingCountry =objac.BillingCountry;
                objac.ShippingStreet =objac.BillingStreet;
                objac.ShippingPostalCode =objac.BillingPostalCode;
                objac.ShippingCity =objac.BillingCity;                
                a.add(objac);            
        }
    }
    public static void createAccountContMethod(list<Account> acc1)
    {
    	list<Contact> Cont = new list<Contact>();
        for(Account objA: acc1)
        {
            if(objA.Industry == 'Banking')
            {
                contact contObj = new contact();
                contObj.LastName = objA.Name;
                contObj.Phone = objA.Phone;
                contObj.AccountId = objA.Id;               
                Cont.add(contObj);             
             }
		}
        insert Cont;      
	}

    public static void createRelatedMethod(list<Account> acclst)
    {
        list<opportunity> op1 = new list<opportunity>();
        list<Contact> con =new list<Contact>();
        for(Account obj1:acclst)
	{
            contact c1 = new contact();
            c1.LastName ='test Lastname';
            c1.Phone ='9800000000';
            c1.AccountId = obj1.Id;
            con.add(c1);
            opportunity op = new opportunity();
            op.Name ='test oppname';
            op.CloseDate = date.parse('08/19/2021');
            op.StageName ='Prospecting';
            op.AccountId = obj1.Id;
            op1.add(op);
    }
       insert con; 
        insert op1;
   	}
    public static void updateAcc(List<opportunity> oplst)
    {
        set<id> acId = new set<id>();
        list<Account> newacc =  new list<Account>();
     for(opportunity op1 : oplst)
     {
         if(op1.StageName == 'Closed Won')
         {
          acId.add(op1.AccountId);
         }
     }
      list<Account> ac1 = [select id,Rating from Account where id=:acId];
        if(ac1 != null)
        {
            for(Account a1 : ac1)
            {
                a1.Rating = 'Hot';
                newacc.add(a1);
            }
        }
        update newacc;
    }
    
    public static void contactsCreate(list<Account> ac)
    {
     list<Contact> con1 = new list<Contact>();
        for(Account ac1: ac)
        {
            if(ac1.Number_Loc__c != null && ac1.Number_Loc__c> 0)
            {
            for(integer i=1; i<= ac1.Number_Loc__c; i++)
            {
              contact c = new contact();
                c.LastName = 'Test contact' +i;
                c.AccountId = ac1.id;
                con1.add(c);
            }  
            }
        }
        insert con1;        
    }
    
    
    }