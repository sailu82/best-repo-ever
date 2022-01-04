trigger pincodeTrigger on Account (after insert,after update) {
 if(!System.isFuture() && !System.isBatch()){
    for(Account acc:trigger.new){
        pincodeCls.callcount(acc.BillingPostalCode,acc.Id);
    }
    }
}