global class batchAsset implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([Select id,Name,IsWon,HasOpportunityLineItem,accountId from Opportunity where name='viraat']);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> lOppObj){
        List<Asset> AssetList = new List<Asset>();
        list <OpportunityLineItem> OLI=new list<OpportunityLineItem>();
        for(opportunity oppObj:lOppObj)
        {
            if(oppObj.IsWon == true && oppObj.HasOpportunityLineItem == true && oppObj.AccountId !=null)
            {
                
                
                Asset a = new Asset();
                for(OpportunityLineItem ol: OLI){
                    a = new Asset();
                    a.AccountId = OppObj.AccountId;
                    a.Product2Id = ol.PricebookEntry.Product2Id;
                    a.Quantity = ol.Quantity;
                    a.Price =  ol.UnitPrice;
                    a.PurchaseDate = OppObj.CloseDate;
                    a.Status = 'Purchased';
                    a.Description = ol.Description;
                    a.Name = ol.PricebookEntry.Product2.Name;
                    AssetList.add(a);
                    
                }
            }
            
        }
        update OLI;
        insert AssetList;
    }
    public void finish(Database.BatchableContext bc)
    {
        
    }
}