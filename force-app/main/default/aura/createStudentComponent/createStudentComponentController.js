({
	doSave : function(component, event, helper) {
	var std =component.get("c.createStudentAccount");
        std.setParams({'stuobj':component.get('v.studentobj')});
        
        std.setCallback(this,function(data){
            component.set('v.Id', data.getReturnValue())
        })
            $A.enqueueAction(std);                 
                       
    },

})