trigger trigger5 on Opportunity (before insert, after insert) {
    Pricebook2 standardBook = [SELECT Id FROM Pricebook2 WHERE IsStandard = true];
    if(Trigger.isBefore) {
        for(Opportunity record: Trigger.new) {
            record.Pricebook2Id = standardBook.Id;
        }
    }
    if(Trigger.isAfter) {
        OpportunityLineItem[] lines = new OpportunityLineItem[0];
        PricebookEntry entry = [SELECT Id, UnitPrice FROM PricebookEntry WHERE Pricebook2Id = :standardBook.Id AND Product2.ProductCode = 'DEFAULT'];
        for(Opportunity record: Trigger.new) {
            lines.add(new OpportunityLineItem(PricebookEntryId=entry.Id, OpportunityId=record.Id, UnitPrice=entry.UnitPrice, Quantity=1));
        }
        insert lines;
    }
}