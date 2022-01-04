public class LocationHandler {
 @InvocableMethod(label='Patient Flow' description='Enter Patient Details')
    public static list<Patient_Detail__c> getverifyAddress(list<flowinput> input)
    {            
        //boolean verify = false;
        string FirstName = input.get(0).FirstName;
        string LastName = input.get(0).LastName;
        string City = input.get(0).City;
        string State = input.get(0).State;
        string PostalCode = input.get(0).PostalCode;
        string LastFourDigitsOfSSN = input.get(0).LastFourDigitsOfSSN;
        string Phone = input.get(0).Phone;
        string Email = input.get(0).Email;
        string MiddleName = input.get(0).MiddleName;
        
        list<Patient_Detail__c> Pa = new List<Patient_Detail__c>();
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
                Patient_Detail__c pt = new Patient_Detail__c();
                if(!String.isBlank(ResponseBody) && ResponseBody.length() > 2 && !ResponseBody.contains('conflict') &&!ResponseBody.contains('invalid'))
                {
                    
                    
                    //pt.Name = FirstName+''+''+LastName;
                    pt.First_Name__c = FirstName;  
                    pt.Last_Name__c= LastName;
                    pt.Middle_Name__c= MiddleName;    
                    pt.State__c = State;
                    pt.City__c= City;
                    pt.Postal_Code__c = PostalCode;
                   // pt.Last_Four_Digits_Of_SSN__c = SSN;
                    //pt.Address__c = Address;
                    //pt.Gender__c = value1;
                    pt.Patient_Email__c = email;
                    pt.Patient_Phone__c = phone;
                    //pt.Date_Of_Birth__c = dob;
                    //pt.Gender__c=gender;
                    Pa.add(pt);
                    system.debug(pt);
                    system.debug(pa);
                    pt.Verified__c= true;                
                }                  
                else
                {
                    pt.Verified__c = false;
                } 
                 insert Pa;  
            } 
            
             
        }                
        catch(System.CalloutException ex )
        {
            System.debug(' Exception Executed '+ex.getStackTraceString());
        }          
        return pa ;
    }   
    public class flowinput{
        @invocablevariable public string FirstName;
        @invocablevariable public string MiddleName;
        @invocablevariable public string LastName;
            @invocablevariable public string City;
            @invocablevariable public string State;
            @invocablevariable public string PostalCode;
            @invocablevariable public string LastFourDigitsOfSSN;
            @invocablevariable public string Phone;
            @invocablevariable public string Email;
        
            
    }
}