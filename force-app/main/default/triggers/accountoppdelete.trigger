trigger accountoppdelete on Account ( before delete, after delete) {
    for (Account a : [SELECT Id, Rating FROM Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity) AND id IN :Trigger.old])
                       {
                      system.debug('@@@Rating:'+a.Rating);
                      system.debug('@@@Id :' +a.Id);
                    if(a.Rating == 'Hot' || a.Rating =='Warm')
                    
                     {                    
                        
       Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related opportunities.');
    }
    
    
}
}