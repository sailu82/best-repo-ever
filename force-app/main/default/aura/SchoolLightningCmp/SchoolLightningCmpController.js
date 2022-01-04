({
    handleShowActiveSectionName: function (cmp, event, helper) {
        alert(cmp.find("accordion").get('v.activeSectionName'));
    },
    handleSetActiveSectionC: function (cmp) {
        cmp.find("accordion").set('v.activeSectionName', 'C');
    },
   
	doSave : function(component, event, helper) {
        var std =component.get('v.studobj');
	    var act =component.get("c.createstd");
        act.setParams({'stdobj':component.get('v.studobj')});               
       $A.enqueueAction(act); 
          component.set('v.bval',false);
    },
    showForm : function(component, event, helper){
        component.set('v.bval',true);
 }, 
     myAction : function(component, event, helper) {     
          var action = component.get("c.checkMethod"); 
            action.setCallback(this,function(response){               
        component.set("v.stdList",response.getReturnValue()); 
                
            });
            $A.enqueueAction(action);
 },
    handleClick: function(cmp, event, helper) {
     var navService = cmp.find("navService");
     var pageReference = {
                         "type": "standard__component",
                         "attributes": {
                                         "componentName": "c__myForm"
                                       }, 
                         "state": {
                             'message':'This is the target page'
                         }
                        };
     navService.navigate(pageReference);
    }

    
});