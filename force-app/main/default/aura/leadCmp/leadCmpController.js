({
    handleOnSubmit : function(component, event, helper) {
        event.preventDefault(); //Prevent default submit
        var eventFields = event.getParam("fields"); //get the fields
        eventFields["Description"] = 'Lead was created from Lightning RecordEditForm'; //Add Description field Value
        component.find('leadCreateForm').submit(eventFields); //Submit Form
    }
})