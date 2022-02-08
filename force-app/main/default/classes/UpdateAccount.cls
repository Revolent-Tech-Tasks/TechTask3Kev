public with sharing class UpdateAccount {
    public static void updatePriority() {
        List<Account> accsToUpdate = new List<Account>();

        for (List<Account> accs: [SELECT Id, AnnualRevenue FROM Account]) {
            for (Account a: accs) {
                if (a.AnnualRevenue != null) {
                    accsToUpdate.add(a);
                }
            }
        }

        for (Account a: accsToUpdate) {
            if (a.AnnualRevenue >= 800000000) {
                a.CustomerPriority__c = 'High';
            } else if (200000000 >= a.AnnualRevenue && a.AnnualRevenue < 800000000) {
                a.CustomerPriority__c = 'Medium';
            } else {
                a.CustomerPriority__c = 'Low';
            }
        }

        update accsToUpdate;
    }
}
