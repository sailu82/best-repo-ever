trigger caseaccounttrigger on Account (before insert, after insert,before update, after update, before delete, after undelete) {
     System.debug('@@@ is insert :'+Trigger.isinsert);
     System.debug('@@@ is After :'+Trigger.isAfter);
     System.debug('@@@ is Before :'+Trigger.isBefore);
     System.debug('@@@ is Update :'+Trigger.isUpdate);
     System.debug('@@@ is Delete :'+Trigger.isDelete);
     System.debug('@@@ is undelete :'+Trigger.isundelete);
     
     

      if(Trigger.isafter && Trigger.isupdate){

      caserecordinsertion.insertcaserecord(trigger.new, trigger.oldmap);
}
}