({
	doSave : function(component, event, helper) {
	    var act =component.get("c.createAccount1");
        act.setParams({'accobj':component.get('v.accountobj')});  
        act.setCallback(this,function(data){
            component.set('v.accountId', data.getReturnValue())
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
            
             }); 
        $A.enqueueAction(act);                 
                       
    },
})