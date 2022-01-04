({  
 valueChanged : function(component, event, helper) 
    {
        var unsaved = component.find("unsaved");
        unsaved.setUnsavedChanges(true, { label: 'You have unsaved changes. Do you want to Continue' });
    },
    handleSave: function(component, event, helper) {
        
     },
     handleDiscard: function(component, event, helper) {
       
     }
})