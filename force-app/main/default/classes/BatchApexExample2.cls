global class BatchApexExample2 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT Id, LastName FROM Contact';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Contact> accList) {
        
        // process each batch of records default size is 200
        for(Contact acc : accList) {        
            // Update the Account Name 
            acc.LastName = acc.LastName + 'Test Name';
        }
        try {
            // Update the Account Record
            update accList;
         
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}