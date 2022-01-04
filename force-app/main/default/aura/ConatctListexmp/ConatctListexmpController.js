({
	doInit : function(component, event, helper) {
	var action = component.get('c.getContactList');
        action.setParams({accountId: component.get('v.recordId')});
        action.setCallback(this,function(response){
      var responseval = response.getReturnValue();
            console.log('responseval', responseval)
       component.set('v.ConatactList', responseval);
        }); 
    
    $A.enqueueAction(action);
	},
    doRedirect : function(component, event, helper) {
      var eventSource1 = event.getSource();
        var id = eventSource1.get('v.name');
        alert(id);
        
    },
})