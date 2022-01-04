({
	doAdd : function(component, event, helper) {
        var num1 = component.get('v.input1');
        var num2 = component.get('v.input2');
        component.set('v.result',(parseInt(num1) + parseInt(num2)));
		
	},
    doSub : function(component, event, helper) {
        var num1 = component.get('v.input1');
        var num2 = component.get('v.input2');
        component.set('v.result',(parseInt(num1) - parseInt(num2)));
    },
    doMul : function(component, event, helper) {
        var num1 = component.get('v.input1');
        var num2 = component.get('v.input2');
        component.set('v.result',(parseInt(num1) * parseInt(num2)));
    },
    doDiv : function(component, event, helper) {
        var num1 = component.get('v.input1');
        var num2 = component.get('v.input2');
        component.set('v.result',(parseInt(num1) / parseInt(num2)));
    }
})