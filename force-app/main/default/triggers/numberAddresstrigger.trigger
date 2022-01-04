trigger numberAddresstrigger on AddressP__c (before insert, after insert, before update, after update, before delete, after delete) {
    
    if(trigger.isAfter && trigger.isInsert){
        addressCls1.calculateNumberOfContacts(trigger.new);
    }
    if(trigger.isBefore && trigger.isDelete){
        addressCls1.calculateNumberOfContactsDelete(trigger.old);
    }
}