({
	doSave : function(component, event, helper) {
          var std =component.get('v.studobj');
	          var act =component.get("c.createstd");
             act.setParams({'stdobj':std});
        var phoneCmp = component.find('phone');
       	var phoneCmpValue = phoneCmp.get("v.value");
        //Custom regular expression for phone number
        var phoneRegexFormat = /^\d{10}$/;
        //Check for regular expression match with the field value
        if(!phoneCmpValue.match(phoneRegexFormat)) {
           //set the custom error message
            phoneCmp.setCustomValidity("Enter valid phone number");
        }else{
           //reset the error message
            phoneCmp.setCustomValidity("");
        }
        //Group all the fields ids into a JS array
        var controlAuraIds = ["firstName","lastName","email","phone","Department"];
       //reducer function iterates over the array and return false if any of the field is invalid otherwise true.
        let isAllValid = controlAuraIds.reduce(function(isValidSoFar, controlAuraId){
           //fetches the component details from the auraId
            var inputCmp = component.find(controlAuraId);
           //displays the error messages associated with field if any
            inputCmp.reportValidity();
           //form will be invalid if any of the field's valid property provides false value.
            return isValidSoFar && inputCmp.checkValidity();
        },true);
        
         
             
    
        /*act.setCallback(this,function(data){
            component.set('v.studId', data.getReturnValue())
            var state= data.getState();
            console.log(state);
            if(state === "SUCCESS"){
               console.log('Before');
                var toastEvent = $A.get("e.force:showToast");
                console.log(toastEvent);
                toastEvent.setParams({
            title : 'Success Toast Message',
            message: 'Account Created...!!!',
            duration:' 4000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });         
        toastEvent.fire();
            }
            
             }); */

         $A.enqueueAction(act);                 
                       
    }
})