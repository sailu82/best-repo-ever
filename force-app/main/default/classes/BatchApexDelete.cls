global class BatchApexDelete implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator('Select Id,Name from account where Name="Test" limit 100');
    }
    public void execute(Database.BatchableContext bc, List<asset> lstAtt){
        
        delete lstAtt;
    }
    public void finish(Database.BatchableContext bc)
    {
        
    }
    
}