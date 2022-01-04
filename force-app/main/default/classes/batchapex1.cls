global class batchapex1 implements Database.Batchable<sObject>
{
    public string query = 'Select Name , StageName,CloseDate from Opportunity where Name =\'Sowji\'' ;
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        Return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList)
    {
        // List<Opportunity> oppList = new List<opportunity>();
        List<attachment> AttachtList = new List<attachment>();
        for(Opportunity opp:oppList)
        {
            if(opp.Name =='Sowji' && string.isNotBlank(opp.AccountId ))
            {
                Opportunity opps = new opportunity();
                //opp.Name = 'Laxmi';
                opp.AccountId = opps.AccountId;
                opp.StageName = opps.StageName;
                opp.CloseDate = opps.CloseDate;
                oppList.add(opp);
                for(integer i=0;i<=100;i++)
                {
                    Attachment attachment = new Attachment();
                    attachment.Body = Blob.valueOf(opps.Name);
                    attachment.Name = String.valueOf('test.txt');
                    attachment.ContentType='text/palin';
                    attachment.ParentId = opps.Id; 
                    AttachtList.add(attachment);
                }
            }insert AttachtList;
        }
    }
    global void finish (Database.BatchableContext bc)
    {
        /*AsyncApexJob a = [ SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedById
                          FROM AsyncApexJob
                          WHERE Id =: bc.getJobId() ];
        Messaging.SingleEmailMessage batchEmail = new Messaging.SingleEmailMessage();
        batchEmail.setTargetObjectId( a.CreatedById );
        batchEmail.setSubject( 'Asset Delete Batch ' + a.Status );
        batchEmail.setPlainTextBody( 'Jobs processed ' + a.JobItemsProcessed + ' with '+ a.NumberOfErrors + ' failures.' );
        batchEmail.setSaveAsActivity( false );
        Messaging.sendEmail( new Messaging.SingleEmailMessage[] { batchEmail } );
    }*/
}
}

/*Batch_Opp_On_Asset be = new Batch_Opp_On_Asset();
id Batchid = Database.executebatch(be);*/