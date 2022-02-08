public with sharing class AccountUtils {
    public static List<Id> createAccs(List<String> inputList) {
        List<Id> idList = new List<Id>();
        List<Account> accToInsert = new List<Account>();

        for (String name: inputList) {
            Account newAcc = new Account (Name = 'name');
            accToInsert.add(newAcc);
        }

        insert accToInsert;

        for (Account a: accToInsert) {
            idList.add(a.Id);
        }

        return idList;
    }
}
