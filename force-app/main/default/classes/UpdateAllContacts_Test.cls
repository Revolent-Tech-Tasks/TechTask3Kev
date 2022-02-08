@isTest
private class UpdateAllContacts_Test {
    @isTest static void verifyPreferredContact() {
        // Create test accounts to be updated by batch
        List<Contact> conList = new List<Contact>();
        for (Integer i=0; i < 200; i++) {
            Contact con = new Contact(LastName = 'LastName ' + i);
            conList.add(con);
        }
        insert conList;

        Test.startTest();
        UpdateAllContacts b = new UpdateAllContacts();
        Database.executeBatch(b);
        Test.stopTest();
     

        Contact[] conUpdatedList = [SELECT Id, Preferred__c FROM Contact];
        System.assert(conUpdatedList[0].Preferred__c.Contains('Mobile'));
    }
}