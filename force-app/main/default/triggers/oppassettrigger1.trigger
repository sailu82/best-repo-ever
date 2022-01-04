trigger oppassettrigger1 on Opportunity (after insert, after update) {
    Opportunitylineitem[] OLI = [Select Quantity,UnitPrice,PricebookEntry.Product2Id, 
                                 PricebookEntry.Product2.Name, Description from opportunitylineitem 
                                 where opportunityId IN: trigger.new AND Opportunity.iswon = true AND Opportunity.hasOpportunitylineitem = true];
    List<Asset> assetList = new List<Asset>();        
    for(opportunitylineitem ol:OLI){
       asset a = new asset();
        a.AccountId=ol.opportunity.AccountID;
        a.Quantity=ol.quantity;     
        a.Product2Id=ol.PricebookEntry.Product2Id;
        a.price=ol.UnitPrice;
        a.Description=ol.Description;
        a.name=ol.PricebookEntry.Product2.Name;
        assetList.add(a);   
    }       
    insert assetList;           
}