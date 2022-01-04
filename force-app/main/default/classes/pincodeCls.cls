public class pincodeCls {
 @future(callout=true)
 Public static void callcount(string zipcode,id ids){
     Http http=new Http();
     HttpRequest req=new HttpRequest();
     req.setEndpoint('https://api.postalpincode.in/pincode/'+zipcode);
     req.setMethod('GET');
     HttpResponse res = http.send(req);
     system.debug('--->>'+res);
     if(res.getStatus()=='OK' && res.getStatusCode()==200){
       //To deserialize the JSON body , created a class pincode 
        pincode pc=(pincode)JSON.deserializeUntyped(res.getBody());
         system.debug('pc');
        Account accd=[select id,BillingCity from Account where id=:ids limit 1];
         system.debug('---->>>++'+accd.BillingCity);
         if(accd.BillingCity==''||accd.BillingCity==Null){
             accd.BillingCity=pc.PostOffice[0].Circle;
             update accd;
         }  
       }
     }
}