global class BatchApexExampleOppSchedule implements Schedulable
		{
   public static Schedule_classes__c scheduleobj = [SELECT id,Name,Batch_Name__c,Batch_Size__c,Schedule_Time__c from Schedule_classes__c where Name ='AnonymizeData' limit 1];
   global static string invokeschedule() {
   return system.schedule(scheduleobj.Batch_Name__c,scheduleobj.Schedule_Time__c, new BatchApexExampleOppSchedule());
   		}
        global void execute(SchedulableContext ctx)
        {
        batchApexExampleOpp  anydata = new batchApexExampleOpp ();
        Database.executebatch(anydata,Integer.valueof(scheduleobj.Batch_Size__c));
        
    	}
}