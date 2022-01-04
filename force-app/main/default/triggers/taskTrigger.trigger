trigger taskTrigger on Account (after insert,after update) {
    
   /* for(Account a: trigger.new){
        if(a.Industry =='Energy'){--- after update context  lock the records
            a.Rating ='Hot';---------after context the trigger context variables only in readonly mode
so this result in runtime error
        
        }
    }*/
    
    
    
    
    if(trigger.isAfter && trigger.isUpdate){
        list<task> taskToBeCreated = new list<task>();
        list<attachment> lstattachment = new list<attachment>();
        for(account acc: trigger.new){
            if(acc.Industry == 'Education' && Trigger.oldMap.get(acc.Id).Industry=='Banking'){
                task t= new task(
                Subject='industry change action',
                    OwnerId = acc.OwnerId,
                    WhatId =acc.Id);
                
                taskToBeCreated.add(t);
                Attachment attachment = new Attachment();
                    attachment.Body = Blob.valueOf(acc.Name);
                    attachment.Name = String.valueOf('test.txt');
                    attachment.ContentType='text/palin';
                    attachment.ParentId = acc.Id; 
                    lstattachment.add(attachment);
            }
        }
        If(lstattachment.size()>0){
            insert lstattachment;
        } 
        
    }

}