({
    submitAccountInfo : function(component, event, helper) {       
        var isValidate = true;        
        var Name = component.find('Name1');        
        var NameVal = component.find('Name1').get('v.value');        
        if($A.util.isUndefinedOrNull(NameVal) || $A.util.isUndefined(NameVal) || $A.util.isEmpty(NameVal)){
            Name.set("v.errors",[{message:'Name is required'}]);
            isValidate = false;
        }else{
            Name.set("v.errors",null);
        }
        var isValidate = true;   
        var p1 = component.find('pn1');        
        var pVal = component.find('pn1').get('v.value');  
        var phoneRegexFormat = /^\d{10}$/;
        if($A.util.isUndefinedOrNull(pVal) || $A.util.isUndefined(pVal) || $A.util.isEmpty(pVal) || !pVal.match(phoneRegexFormat)){
            p1.set("v.errors",[{message:'Enter valid phone number'}]);
            //p1.setCustomValidity("Enter valid phone number");
           isValidate = false;
        }else{
            p1.set("v.errors",null);
            //p1.setCustomValidity("");
        }  
        var isValidate = true;   
        var a1 = component.find('Ar1');        
        var arVal = component.find('Ar1').get('v.value');        
        if($A.util.isUndefinedOrNull(arVal) || $A.util.isUndefined(arVal) || $A.util.isEmpty(arVal)){
            a1.set("v.errors",[{message:'enter Annual Revenue'}]);
            isValidate = false;
        }else{
            a1.set("v.errors",null);
        }    
        
        if(isValidate){
             var action = component.get('c.getAccount');
             var postData =  component.get('v.accountInfo');                
             action.setParams({"acc": postData});
            
            action.setCallback(this, function(response) {            
            var state = response.getState();  
            if (state === "SUCCESS") {                
                var stringItems = response.getReturnValue();
                component.set("v.AccountItrt",stringItems);
                component.set("v.accountInfo", null);       
                
                //Show the success toast message
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title":"Success",
                    "type":"success",
                    "message":"Form submitted successfully.",                        
                });
                toastEvent.fire();            
            
            }
                
        }); 
        
        $A.enqueueAction(action);
            
        }
        
    },
    
})