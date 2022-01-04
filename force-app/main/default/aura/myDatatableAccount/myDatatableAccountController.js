({
	doInit : function(component, event, helper) {
        var actions = [{
            		   label : 'Show Details',name : 'show_details', iconName : 'action:preview'},
                     {label : 'Delete',name : 'delete',iconName : 'action:delete'
                      }];                    
	     component.set('v.columns', [
              {label: 'Account Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},	
			{label: 'Industry', fieldName: 'Industry', type: 'text'},
         	{label: 'Rating', fieldName: 'Rating', type: 'text'},
             {label: 'Phone', fieldName: 'Phone', type: 'text', editable : 'true'},
         	{label: 'Account Site', fieldName: 'Site', type: 'text'},
            {type:"action", typeAttributes : { rowActions : actions }}
         ]);
         var action = component.get('c.fetchAccounts');
         action.setCallback(this, function(response1){
         var state = response1.getState();
         if(state === "SUCCESS"|| state === "DRAFT"){
         var responseValue1 = response1.getReturnValue();
             responseValue1.forEach(function(record){
                 record.linkName ='/'+record.Id;
             });
             component.set('v.data', responseValue1 );
         }
         });
         $A.enqueueAction(action);
         },
    doSelectionrecord : function(component, event, helper){
        alert('rows selected');
        var selectedRows = event.getParam('selectedRows');
        
        console.log('selectedRows', selectedRows);
    },
    handleRowaction : function(component, event, helper){
        var action1 = event.getParam('action');
        var row1 = event.getParam('row');
        console.log('action', action1.name);
        console.log('row', row1.Id);
        switch (action1.name) {
            case 'show_details': 
                alert(row1.Id+''+row1.Name+ ''+row1.Industry);
                break;
            case 'delete':
                var data = component.get('v.data');
                var index = data.indexOf(row1);
                data.splice(index, 1);
                component.set('v.data',data);
                break;
        }
    },
    handlesave : function(component, event, helper){
        var draft1 = event.getParam('draftValues');
        console.log('draft1', draft1);
         component.set('v.saveDraftValues', draft1);
        //console.log('draftValues', draftValues);
        //var draftRecords = event.getParam('draftValues');
        //console.log('draftRecords' , draftRecords);
    }
                               
})