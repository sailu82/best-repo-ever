({
	doInit : function(component, event, helper) {
	var action = component.get("c.getAccList");
        //var Id = component.get("v.recordId");
        //action.setParams({
            //"recordId":Id
        //});
            action.setCallback(this, function(response) {
           var result = response.getReturnValue();
            component.set("v.lstOfacc",result);
        });
           $A.enqueueAction(action,false);
            
        }
	})