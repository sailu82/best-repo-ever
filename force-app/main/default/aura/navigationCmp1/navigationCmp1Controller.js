({
    doInit : function(component, event, helper) {
        
    },
    navigateto : function(component, event, helper) {
        var navgigateLightning = component.find('navigate');
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'list'
            },
            state: {
                filterName: 'MyContacts'
            } 
        };
        navgigateLightning.navigate(pageReference);
    }
})