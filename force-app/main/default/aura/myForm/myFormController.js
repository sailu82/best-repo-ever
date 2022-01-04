({
    submit : function (component, event, helper) {
        alert('hi');
       var fname1= component.get("v.fname");
        var lname1= component.get("v.lname");
        var pnumber1 = component.get("v.pnumber");
        var dbirth1=component.get("v.dbirth");
        var ecity1=component.get("v.city1");
        var estate1=component.get("v.state1");
        var estreet1=component.get("v.street1");
        alert(fname1);
        alert(lname1);
        
        component.set("v.efirstname", fname1);
        component.set("v.elastname",lname1 );
        component.set("v.ephonenumber",pnumber1 );
        component.set("v.edateofbirth",dbirth1 );
        component.set("v.ecity",ecity1 );
        component.set("v.estate",estate1 );
        component.set("v.estreet",estreet1 );
         component.set('v.mapMarkers', [
            {
                location: {
                    Street: estreet1,
                    City: ecity1,
                    State: estate1
                },

                title: ecity1,
                description: estate1
            }
        ]);
        component.set('v.zoomLevel', 16);
        
        
    }
     
})