trigger triggeraccphone on Account (before insert, before update) {
    if(Trigger.isBefore && Trigger.isupdate){
        accountPhoneHandler.updatePhoneMethod(Trigger.New, Trigger.oldMap);
    } 

}