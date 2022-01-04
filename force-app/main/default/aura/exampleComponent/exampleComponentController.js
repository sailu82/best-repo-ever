({
    addAccounts: function(component, event, helper)
    {
        var acclist1 = component.get('v.accountobj');
        helper.accList1.push(acclist1);     
        component.set('v.accList',helper.accList1);
        //component.set('v.accountobj',null);
    },
    
    doSave: function(component, event, helper)
    {
        alert('save');
        var action = component.get("c.getRecords");
         action.setParams({
             'accList':component.get('v.accountobj')
          });         
        $A.enqueueAction(action);
       
    },
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for displaying loading spinner 
        component.set("v.spinner", true); 
    },
     
    // function automatic called by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hiding loading spinner    
        component.set("v.spinner", false);
    }
    
    
})