trigger accountTriggerCont on Account (before insert, before update, after insert) {
  if(Trigger.isAfter && Trigger.isInsert)
    {
       accountHandler1.contactsCreate(Trigger.New);
    }   
    
    /* if(Trigger.isAfter && Trigger.isInsert )
    {
        accountHandler1.createAccountContMethod(Trigger.New);      
    }*/
    
    if(Trigger.isBefore && Trigger.isInsert)
    {
        accountHandler1.accDupMethod(Trigger.New);
    }
    
   if(Trigger.isBefore && Trigger.isupdate)
   {
        accountHandler1.updatePhoneMethod(Trigger.New, Trigger.oldMap);
   } 
    /*if(Trigger.isBefore && (Trigger.isInsert ||trigger.isUpdate))
    {
        accountHandler1.createAccountMethod(Trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert)
    {      
      accountHandler1.createRelatedMethod(Trigger.new);    
    }*/
    
    
}