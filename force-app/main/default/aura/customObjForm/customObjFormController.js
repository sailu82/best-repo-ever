({
    submitAccountInfo : function(component, event, helper) {       
       
             var action = component.get('c.getCustAccount');
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
    },
    
})