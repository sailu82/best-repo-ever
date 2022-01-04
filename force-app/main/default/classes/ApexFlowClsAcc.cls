public class ApexFlowClsAcc 
{
    @InvocableMethod(label='Delete Related Opportunities' 
                     description='delete related opp'category='Account')
    public static void deleteOpportunities(list<string> ids)
    {
        list<opportunity> oppList= [select id from opportunity where accountId in:ids AND StageName ='Closed Won'];
        delete oppList;
    }
}