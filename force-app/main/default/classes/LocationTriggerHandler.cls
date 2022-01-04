public class LocationTriggerHandler {
    
    @AuraEnabled
    public static boolean verifyAddress(String FirstName,string MiddleName,string LastName,string City ,string State ,string PostalCode,
                                        string SSN,string gender,string Address,string phone, string email, date dob)
    {            
        boolean verify = false;
        list<PatientInformation__c> Pa = new List<PatientInformation__c>();
        String URL = 'https://us-zipcode.api.smartystreets.com/lookup?auth-id=4ffc4fac-808d-11d1-83bd-c90d3c46949d&auth-token=vOs7TYu32xXjA2DAWK4Y';
        URL+='&city='+EncodingUtil.urlEncode(City, 'UTF-8')
            +'&state='+EncodingUtil.urlEncode(State, 'UTF-8')
            +'&zipcode='+EncodingUtil.urlEncode(PostalCode, 'UTF-8')
            +'&match=invalid&candidates=10';
        system.debug(URL);
        HttpRequest Request = new HttpRequest();
        Request.setMethod('GET');
        Request.setEndpoint(URL);
        Request.setHeader('Content-Type', 'application/json');
        Request.setHeader('Accept','application/json');
        Http http = new Http();    
        HttpResponse Response = new HttpResponse();
        try
        {
            Response = http.send(Request);
            System.debug(' ResponseBody '+Response.getBody());    
            
            Object theJsonObject = JSON.deserializeUntyped(Response.getBody());
            List<Object> theJsonList = (List<Object>) theJsonObject;
            List<Map<String, Object>> theJsonMapList = new List<Map<String, Object>>();
            for (Object obj : theJsonList) {
                theJsonMapList.add((Map<String, Object>) obj);  
            }
            System.debug(theJsonMapList);
            if( Response.getStatusCode() == 200 && Response.getStatus() =='OK')
            {
                string responseBody = Response.getBody();
                //Access responseboday data
                
                if(!String.isBlank(ResponseBody) && ResponseBody.length() > 2 && !ResponseBody.contains('conflict') &&!ResponseBody.contains('invalid'))
                {
                    
                    PatientInformation__c pt = new PatientInformation__c();
                    //pt.Name = FirstName+''+''+LastName;
                    pt.First_Name__c = FirstName;  
                    pt.Last_Name__c= LastName;
                    pt.Middle_Name__c= MiddleName;    
                    pt.State__c = State;
                    pt.City__c= City;
                    pt.postal_codes__c = PostalCode;
                    pt.Last_Four_Digits_Of_SSN__c = SSN;
                    pt.Address__c = Address;
                    //pt.Gender__c = value1;
                    pt.PatientEmail__c = email;
                    pt.PatientPhone__c = phone;
                    pt.Date_Of_Birth__c = dob;
                    pt.Gender__c=gender;
                    Pa.add(pt);
                    system.debug(pt);
                    system.debug(pa);
                    Verify= true;                
                }                  
                else
                {
                    Verify = false;
                }  
            } 
            
            insert Pa;    
        }                
        catch(System.CalloutException ex )
        {
            System.debug(' Exception Executed '+ex.getStackTraceString());
        }          
        return verify ;
    }          
}