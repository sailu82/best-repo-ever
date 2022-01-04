trigger triggerlead1 on Lead (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        leadobjHandler.leadobjMethod(Trigger.New);
    }

}