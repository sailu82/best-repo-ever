({        
    doInit : function(component, event, helper) {            
        let action = component.get("c.getLocation");            
        action.setParams({    
            // "Id":component.get("v.recordId")
            // "accountId":component.get("v.recordId")            
        });            
        action.setCallback(this,function(response){                
            let state = response.getState();                
            if(state =='SUCCESS'){                    
                let result = response.getReturnValue();                    
                console.log('Result returned: ' +JSON.stringify(result));                    
                component.set("v.accObj",result);                    
                component.set('v.mapMarkersData',response.getReturnValue());
                component.set('v.zoomLevel',4);            
                component.set('v.mapCenter', {
                    location: {
                        Country:'USA'
                    }
                });        
                component.set('v.markersTitle', 'accounts locations');            
                component.set('v.showFooter', true);                
            }else{                    
                console.log('Something went wrong! ');                
            }            
        });            
        $A.enqueueAction(action);        
    }    
})