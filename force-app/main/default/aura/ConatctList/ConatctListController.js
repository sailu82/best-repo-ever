({
	doInit : function(component, event, helper) {
	var action = component.get('c.getContactList');
        action.setCallback(this,function(response){
      var responseval = response.getReturnValue();
            console.log('responseval', responseval)
        }, 'SUCCESS'); 
    
    $A.enqueueAction(action, false );
	}
})