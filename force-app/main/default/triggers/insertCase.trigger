trigger insertCase on Account (before insert) {
    if(trigger.isInsert && trigger.isBefore)
    {
     insertcaseCls.insertMethod(trigger.new);
    
    }
   
}