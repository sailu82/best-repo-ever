({
	handleLoad : function(component, event, helper) {
		console.log('handle handleLoad');
        component.set("v.showSpinner", false);
	},
    handleSubmit : function(component, event, helper) {
        event.preventDefault(); //Prevent default submit
        var eventFields = event.getParam("fields"); //get the fields
        eventFields["Description"] = 'Lead was created from Lightning RecordEditForm'; //Add Description field Value
        component.find('createAccountForm').submit(eventFields); //Submit Form
        
        component.find('createAccountForm').submit(fields); // Submit form
		console.log('handle handleSubmit');
	},
	handleSuccess : function(component, event, helper) {
		console.log('record updated successfully');
        
        
        component.set("v.showSpinner", false);
	},
})