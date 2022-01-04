global class batchquote1 implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select id,Name from Opportunity');
    }
      public void execute(Database.BatchableContext bc, List<Opportunity> lOppObj){
        list<quote> lstquote=new list<quote>();
          for(opportunity oppObj:lOppObj)
          {
              for(integer i=0;i<100;i++)
              {
                  if(oppObj.Name=='sailu')
                  {
                      quote quo = new quote();
                      quo.Name='Quote-'+oppObj.Name;
                      quo.Opportunityid=oppObj.id;
                      lstquote.add(quo);
                            
                  }
                  
              }
          }
          insert lstquote;
    }
    public void finish(Database.BatchableContext bc)
    {
        
    }
}