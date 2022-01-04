trigger testTrigger2 on Account (before insert,after insert,before update,after update,before delete,after delete,after undelete) {
    
{
    if(trigger.isBefore){
        if(trigger.isInsert){
            system.debug('Before insert trigger:trigger.new :' +trigger.new);//Yes
            system.debug('Before insert trigger:trigger.newmap:' +trigger.newmap);//No
            system.debug('Before insert trigger:trigger.old:' +trigger.old);//No
            system.debug('Before insert trigger:trigger.oldmap:'+trigger.oldmap);//No
            
            
        }
    }
    
    if(trigger.isafter){
        if(trigger.isInsert){
            system.debug('After insert trigger:trigger.new :' +trigger.new);//Yes
            system.debug('After insert trigger:trigger.newmap:' +trigger.newmap);//Yes
            system.debug('After insert trigger:trigger.old:' +trigger.old);//No
            system.debug('After insert trigger:trigger.oldmap:'+trigger.oldmap);//No
            
        }
    }
    
    if(trigger.isBefore){
        if(trigger.isupdate){
            system.debug('Before update trigger:trigger.new :' +trigger.new);//yes
            system.debug('Before update trigger:trigger.newmap:' +trigger.newmap);//yes
            system.debug('Before update trigger:trigger.old:' +trigger.old);//Yes
            system.debug('Before update trigger:trigger.oldmap:'+trigger.oldmap);//Yes
            
        }
    }
    
    if(trigger.isafter){
        if(trigger.isupdate){
            system.debug('After update trigger:trigger.new :' +trigger.new);//yes, it holds updated value
            system.debug('After update trigger:trigger.newmap:' +trigger.newmap);//yes,it holds updated value with ID
            system.debug('After update trigger:trigger.old:' +trigger.old);//yes,it holds only old values
            system.debug('After update trigger:trigger.oldmap:'+trigger.oldmap);//yes
            
        }
    }
    
    if(trigger.isBefore){
        if(trigger.isdelete){
            system.debug('Before delete trigger:trigger.new :' +trigger.new);//no
            system.debug('Before delete trigger:trigger.newmap:' +trigger.newmap);//no
            system.debug('Before delete trigger:trigger.old:' +trigger.old);//yes
            system.debug('Before delete trigger:trigger.oldmap:'+trigger.oldmap);//yes
            
        }
    }
    
    
 if(trigger.isafter){
        if(trigger.isdelete){
            system.debug('After delete trigger:trigger.new :' +trigger.new);//no
            system.debug('After delete trigger:trigger.newmap:' +trigger.newmap);//no
            system.debug('After delete trigger:trigger.old:' +trigger.old);//yes
            system.debug('After delete trigger:trigger.oldmap:'+trigger.oldmap);//yes
            
        }
    }
    
    if(trigger.isafter){
        if(trigger.isundelete){
            system.debug('After undelete trigger:trigger.new :' +trigger.new);//yes
            system.debug('After undelete trigger:trigger.newmap:' +trigger.newmap);//yes
            system.debug('After undelete trigger:trigger.old:' +trigger.old);//no
            system.debug('After undelete trigger:trigger.oldmap:'+trigger.oldmap);//no
            
        }
    }
    
}

}