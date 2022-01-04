trigger Attachmenttrigger on Attachment (before delete, after delete) {
    
    if(trigger.isbefore && trigger.isdelete){
    
      attchmentClass.attchemntdeletionmethod(trigger.old);  
    }

}