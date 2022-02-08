@isTest
private class AccountDeleteTriggerHandler_Test {
    @isTest static void AccountDeleteTriggerHandler_Test() {
        Account accountWithoutOpp = new Account(Name = 'accountWithoutOpp');
        Account accountWithOpp = new Account(name = 'accountWithOpp');

        insert accountWithOpp;
        insert accountWithoutOpp;

        List<Opportunity> testOpps = new List<Opportunity>();

        for (Integer i = 0; i < 200; i++) {
            Opportunity newOpp = new Opportunity(Name = 'New Opp' + i, AccountId = accountWithOpp.Id, StageName = 'Open', CloseDate = Date.today());
            testOpps.add(newOpp);
        }

        insert testOpps;

        Test.startTest();
        Database.DeleteResult accountWithoutOppSR= Database.delete(accountWithoutOpp);
        System.assert(accountWithoutOppSR.isSuccess());

        try {
            Database.DeleteResult accountWithOppSR= Database.delete(accountWithOpp);
            System.assert(!accountWithOppSR.isSuccess());
        } catch (DMLException e){
            System.assertEquals(e.getTypeName(), 'System.DmlException');
            System.debug(e.getTypeName() + e);
        }

        Test.stopTest();
        
    }
}
