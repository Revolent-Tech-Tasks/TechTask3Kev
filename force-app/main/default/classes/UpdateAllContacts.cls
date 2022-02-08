global class UpdateAllContacts implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT Id, Name, Preferred__c FROM Contact';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Contact> contactList) {
        
        // process each batch of records default size is 200
        for(Contact con : contactList) {        
            // Update the Account Name 
            con.Preferred__c = 'Mobile';
        }
        try {
            update contactList;
        } catch(Exception e) {
            System.debug(e);
        }
    }   
     
    global void finish(Database.BatchableContext BC) {
    }
}
