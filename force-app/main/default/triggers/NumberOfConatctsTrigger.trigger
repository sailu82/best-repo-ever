trigger NumberOfConatctsTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete) {
    
    if(trigger.isAfter && trigger.isInsert){
        numberOfConatcts.calculateNumberOfContacts(trigger.new);
    }
    if(trigger.isBefore && trigger.isDelete){
        numberOfConatcts.calculateNumberOfContactsDelete(trigger.old);
    }
}