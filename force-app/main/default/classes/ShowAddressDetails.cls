public with sharing class ShowAddressDetails {
@AuraEnabled
    public static list<accountAddressWrapper> getLocation(){
        list<accountAddressWrapper> accWrapList = new list<accountAddressWrapper>();
        list<account> accList = new list<account>();
        for(account acc : [select name, BillingCountry, billingCity, BillingState, Billingpostalcode, BillingStreet
                           from account where billingCountry!=null AND billingcity!=null])
        {
            mapLocationWrapper mapList = new mapLocationWrapper();
            mapList.Street = acc.BillingStreet;
            mapList.PostalCode = acc.Billingpostalcode;
            mapList.City = acc.billingCity;
            mapList.State = acc.billingState;
            maplist.country = acc.billingCountry;            
            accountAddressWrapper accWrap = new accountAddressWrapper();
            accWrap.icon = 'utility:location';
            accWrap.location = maplist;
            accWrap.title = acc.Name;
            accWrapList.add(accWrap);            
        }
        return accWrapList;
    }
    public class accountAddressWrapper{
        @AuraEnabled public string icon{get;set;} 
        @AuraEnabled public string title{get;set;}  
        @AuraEnabled public mapLocationWrapper location{get;set;} 
    }
    public class mapLocationWrapper{
        @AuraEnabled 
        public string Street{get;set;}
        @AuraEnabled 
        public string PostalCode{get;set;}
        @AuraEnabled 
        public string City{get;set;}
        @AuraEnabled 
        public string State{get;set;}
        @AuraEnabled 
        public string Country{get;set;}
    }
   
}