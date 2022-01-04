trigger oppAssetTrigger on Opportunity (after insert, after update) 
{
    String stage;
    Set<id> setOppId = new Set<Id>();
    Opportunity objOpportunity = new Opportunity();
    Id acctId;
    Id contId;
    Id oppId;
    for(Opportunity objOpp: trigger.new)
    {
        if(objOpp.AccountId != null && objOpp.StageName == 'Closed Won' && objOpp.HasOpportunityLineItem == true)
        {
            stage = objOpp.StageName;
            System.debug('++++++trigger.oldmap.get(objOpp.Id)++++++'+trigger.oldmap.get(objOpp.Id));
            objOpportunity = trigger.oldmap.get(objOpp.id);
            acctId = objOpp.AccountId;
            contId = objOpp.ContactId;
            setOppId.add(objOpportunity.Id);
        }
    }
    
    System.debug('+++++stage+++++++'+stage);
    System.debug('+++++objOpportunity++++'+objOpportunity);
    System.debug('+++++setOppId+++'+setOppId);
    
    List<Asset> lstAsset = new List<Asset>();
    if(setOppId.size()>0)
    {
        for(OpportunityLineItem objOLI : [Select UnitPrice, Quantity, ServiceDate, PricebookEntry.Product2Id, PricebookEntry.Product2.Name, Description From OpportunityLineItem
                                          where OpportunityId = :setOppId])
        {
            if(stage != objOpportunity.StageName)
            {
                Asset objAsset = new Asset();
                objAsset.AccountId = acctId;
                //objAsset.Opportunity_Asset__c = objOpportunity.id;
                objAsset.Product2Id = objOLI.PricebookEntry.Product2Id;
                objAsset.Quantity = objOLI.Quantity;
                objAsset.Price =  objOLI.UnitPrice;
                objAsset.PurchaseDate = objOLI.ServiceDate;
                objAsset.Status = 'Purchased';
                objAsset.Description = objOLI.Description;
                objAsset.Name = objOLI.PricebookEntry.Product2.Name;
                lstAsset.add(objAsset);
            }
        }
    }
    system.debug('OLI+++++++++'+lstAsset);
    if(lstAsset != null && !lstAsset.isEmpty())
    {
        insert lstAsset;
    }
}