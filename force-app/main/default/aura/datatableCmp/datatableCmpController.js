({
    doInit: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'Text'},
            {label: 'Rating', fieldName: 'Rating', type: 'Text'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'},     
        ]);
           var action = component.get('c.fetchacc'); 
            action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS' || state === 'DRAFT'){
            var responseVal =response.getReturnValue();
            component.set('v.data',responseVal);
            }
            });
            $A.enqueueAction(action);
            }
            
            
})