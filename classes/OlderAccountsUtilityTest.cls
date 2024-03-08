@isTest
public class OlderAccountsUtilityTest {

    @isTest
    static void testUpdateOlderAccounts() {
        // Create test data
        List<Account> oldAccounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            oldAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert oldAccounts;

        // Call the method to be tested
        Test.startTest();
        OlderAccountsUtility.updateOlderAccounts();
        Test.stopTest();

        // Verify the changes
        List<Account> updatedAccounts = [SELECT Id, Description FROM Account WHERE Id IN :oldAccounts];
        for (Account acct : updatedAccounts) {
            System.assertEquals('Not Heritage Account', acct.Description, 'Description should be updated');
        }
    }
}