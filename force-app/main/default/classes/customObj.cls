public class customObj {

    public static void customMethod(list<Customer_Project__c> lstCust)
    {
        list<opportunity> op1 = new list<opportunity>();
       for (Customer_Project__c c1 : lstCust)
       {
           if(c1.Status__c == 'Active')
           {
             opportunity opp = new opportunity();
               opp.Id = c1.Opportunity__c;
               opp.Active_Customer_Project__c = True;
               op1.add(opp);
               
           }
       }
       update op1; 
    }
}