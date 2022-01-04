trigger numberOfCont on Contact (after insert,after update, after delete, after undelete) {
    if(trigger.isInsert || trigger.isUpdate || trigger.isDelete || trigger.isundelete){
        Countcontact.Countcontacts(trigger.New, trigger.Old);
    
    }

}