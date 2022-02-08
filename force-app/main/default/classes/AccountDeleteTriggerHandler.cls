public with sharing class AccountDeleteTriggerHandler {
    public static void checkOpportunityOnAccount(List<Account> accList) {
        for (Account acc: accList) {
            List<Opportunity> oppList = new List<Opportunity>();
            for (List<Opportunity> opps: [SELECT Name FROM Opportunity WHERE IsClosed = false AND AccountId = :acc.Id]) {
                oppList.addAll(opps);
            }
            if (oppList.size() > 0) {
                acc.addError('There are Open Opportunities asscoiated with the customer');
            }
        }
    } 
}
