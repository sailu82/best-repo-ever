({
	submitAccountInfo : function(component, event, helper) {
	 var inputpn = component.find('pn1');
        var pnValue = inputpn.get('v.value');
        if(parseInt(pnValue).Length < 10){
            inputpn.set("v.errors", [{message:"Age should be more than 18...!!"}]);
            return;
        }
    }	
	
})