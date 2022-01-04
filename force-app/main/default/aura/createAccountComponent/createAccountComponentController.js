({
	doSave : function(component, event, helper) {
	    var act =component.get("c.createAccount1");
        act.setParams({'accobj':component.get('v.accountobj')});  
        act.setCallback(this,function(data){
            component.set('v.accountId', data.getReturnValue())
            var state= data.getState();
            console.log(state);
            if(state === "SUCCESS"){
               console.log('Before');
                var toastEvent = $A.get("e.force:showToast");
                console.log(toastEvent);
                toastEvent.setParams({
            title : 'Success Toast Message',
            message: 'Account Created...!!!',
            duration:' 4000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });         
        toastEvent.fire();
            }
            
             }); 
         /* component.set('v.columns', [
             {label: 'Account Name', fieldName: 'Name', type: 'text', editable :'true'},	
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
             console.log('data called')
         component.set('v.data', responseValue1 );
         }
         }); */
        console.log('called');
      $A.enqueueAction(act);                 
                       
    },
     doInit: function(component, event, helper) {
        var action = component.get("c.getIndustry");
        var inputIndustry = component.find("InputAccountIndustry");
        var opts=[];
        action.setCallback(this, function(a) {
            opts.push({
                class: "optionClass",
                label: "--- None ---",
                value: ""
            });
            for(var i=0;i< a.getReturnValue().length;i++){
                opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
            }
            inputIndustry.set("v.options", opts);
             
        });
        $A.enqueueAction(action); 
    },
    onPicklistChange: function(component, event, helper) {
        //get the value of select option
        var selectedIndustry = component.find("InputAccountIndustry");
        alert(selectedIndustry.get("v.value"));
    }
})