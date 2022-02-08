public class EmployeeNumberMod {
    public static void roundDown() {
        
        for (List<Account> accs : [SELECT Name, NumberOfEmployees FROM Account]) {
            List<Account> accsToUpdate = new List<Account>();
            for (Account a: accs) {
                if (a.NumberOfEmployees < 50) {
                    a.NumberOfEmployees = 0;
                } else {
                    a.NumberOfEmployees -= Math.mod(a.NumberOfEmployees, 20);
                }
                accsToUpdate.add(a); 
            }
            insert accsToUpdate;
        }
    }
}
