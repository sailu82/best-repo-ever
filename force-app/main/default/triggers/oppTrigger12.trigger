trigger oppTrigger12 on Opportunity (before insert, before update, after insert, after update) {
    if(trigger.isAfter && (trigger.isUpdate || trigger.isInsert)){
        accountHandler1.updateAcc(Trigger.New);
    }

}