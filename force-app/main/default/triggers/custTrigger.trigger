trigger custTrigger on Customer_Project__c (before insert, after insert, before update, after update) {
    
    if(trigger.isafter && trigger.isInsert)
    {
     customObj.customMethod(trigger.new);   
    }
    
    

}