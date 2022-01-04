trigger preventcasedelete on Case (before insert, after insert, before update, after update, before delete, after delete) {

     if(trigger.isbefore && trigger.isdelete)
{

     preventdeletecaseclass.preventcasemethod(trigger.old);

}

}