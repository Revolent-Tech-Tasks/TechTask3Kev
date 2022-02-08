public class UpSell {
    public static void createOpps() {
        List<Account> accsToUpdate = new List<Account>();
        List<Opportunity> newOpps = new List<Opportunity>();

        for (List<Account> accs: [SELECT Id, Name, SLA__c FROM Account]) {
            for (Account a: accs) {
                Opportunity newOpp = new Opportunity();
                newOpp.CloseDate = Date.today().addMonths(1);
                newOpp.StageName = 'Prospecting';
                switch on (a.SLA__c) {
                    when 'GOLD' {
                        newOpp.Name = a.Name + 'SLA Upsell - PLATMIUM' ;
                        newOpps.add(newOpp);
                    }
                    when 'SLIVER' {
                        newOpp.Name = a.Name + 'SLA Upsell - PLATMIUM' ;
                        newOpps.add(newOpp);
                    }
                    when 'BRONZE' {
                        newOpp.Name = a.Name + 'SLA Upsell - PLATMIUM' ;
                        newOpps.add(newOpp);
                    }
                }
            }
            insert newOpps;
        }
    }
}
