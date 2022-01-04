({
	doCreateMap : function(component, event, helper) {
		var maps = [];
        for( var i=0; i<10; i++ ){
            maps.push({
                key:i,
                value:'test '+i
            }); 
        }
       component.set('v.mapvar', maps);
	}
})