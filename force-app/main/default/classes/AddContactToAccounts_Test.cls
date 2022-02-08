@isTest
private class AddContactToAccounts_Test {
    @isTest static void TestContactAdded() {
        List<Account> listAcc = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account newAcc = new Account (Name = 'TestAccount' + i, BillingState = 'AZ');
        }
        insert listAcc;

        Contact conToAdd = new Contact(LastName = 'Test');

        Test.startTest();
        AddContactToAccounts.AddContacts(conToAdd, 'AZ');
        Test.stopTest();

        for (Account updatedAcc: [SELECT Name, BillingState, (SELECT Name FROM Contacts) FROM Account WHERE BillingState = 'AZ']) {
            for (Contact c: updatedAcc.Contacts) {
                c.Name.contains('Test');
            }
            
            
        }
    }
}
