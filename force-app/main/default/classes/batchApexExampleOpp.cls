global class batchApexExampleOpp implements Database.Batchable<sObject>
{
    public string query ='select Id,Name from opportunity where Name=\'Sailaja\'' ;
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<opportunity> scope){
        
        list<attachment> lstattachment=new list<attachment>();
        for(opportunity oppObj:scope) 
        {
            for(integer i=0; i<11000;i++)
            {
                if(oppObj.Name=='sailaja')
                {
                    Attachment attachment = new Attachment();
                    attachment.Body = Blob.valueOf(oppObj.Name);
                    attachment.Name = String.valueOf('test.txt');
                    attachment.ContentType='text/palin';
                    attachment.ParentId = oppObj.Id; 
                    lstattachment.add(attachment);
                } 
            } 
        }
        insert lstattachment;         
    }
    public void finish(Database.BatchableContext bc)
    {
        
    }
}