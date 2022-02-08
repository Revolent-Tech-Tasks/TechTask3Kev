public class AddContactToAccounts {
    public static void AddContacts(Contact contact, String state) {
        List<Account> accListToUpdate = new List<Account>();

        for (Account acc: [SELECT Id FROM Account WHERE BillingState = :state]) {
            accListToUpdate.add(acc);
        }

        for (Account acc: accListToUpdate) {
            acc.Contacts.add(contact);
        }

        update accListToUpdate;
    }
}
