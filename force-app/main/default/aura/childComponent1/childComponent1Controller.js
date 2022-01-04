({
	fireComponentEvent : function(component, event, helper) {
		var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({"message":"Child component fired by component event"});
        cmpEvent.fire();
    }
    
	
})