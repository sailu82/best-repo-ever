({
    ModelToastMsg : function(component, event, helper,msg) {
        var modalBody;
        $A.createComponent("c:overLayLibraryCmp3", { "body":msg},
                           function(content, status) {
                               if (status === "SUCCESS") {
                                   modalBody = content; 
                                   component.find('overlayLib').showCustomModal({
                                       header: "Overlay message panel",
                                       body: modalBody, 
                                       showCloseButton: true,
                                       cssClass: "slds-modal_small",  
                                       closeCallback: function() {
                                       }
                                   })
                               }                               
                           }); 
        
    }
})