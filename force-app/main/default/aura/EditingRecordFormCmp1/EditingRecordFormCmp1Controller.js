({
	handleSubmit : function(component, event, helper) {
		const fields = event.getParam('fields');
        fields.Name = 'My Custom Name'; // modify a field
        component.find('myRecordForm').submit(fields);
	}
})