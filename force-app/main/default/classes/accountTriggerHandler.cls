public class accountTriggerHandler {
    public static void createAccountMethod(list<Account> acc){
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
        //return a;
    }

}