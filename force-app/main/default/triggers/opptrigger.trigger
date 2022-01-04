trigger opptrigger on opportunity (before delete, after delete) {
    
    if(trigger.isbefore && trigger.isdelete){
    
      oppclass.oppmethod(trigger.old);  
    }

}