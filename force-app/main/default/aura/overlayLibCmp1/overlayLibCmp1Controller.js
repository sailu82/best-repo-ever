({
    handleShowModal: function(component) {
        var fName = component.get("v.FirstName");
        var lName = component.get("v.LastName");
        $A.createComponent("c:overlayLibCmp",
                           {
                               "FirstName" : fName,
                               "LastName" : lName
                           },
                           function(content, status) {
                               if (status === "SUCCESS") {
                                   var modalBody = content;
                                   component.find('overlayLib').showCustomModal({
                                       header: "Welcome to Modal window",
                                       body: modalBody, 
                                       showCloseButton: true,
                                       closeCallback: function(ovl) {
                                           console.log('Overlay is closing');
                                       }
                                   }).then(function(overlay){
                                       console.log("Overlay is made");
                                   });
                               }
                           });
    }
})