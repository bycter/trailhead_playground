/**
 * Created by d.yoshchik on 23.8.18.
 */
@IsTest
private class AccountManagerTest {
    @IsTest
    static void testGetAccount() {
        Id recordId = createTestAccount();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI =
                'https://brave-raccoon-94386-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
                        + recordId + '/contacts';
        request.httpMethod = 'GET';
        System.debug(request.requestURI);
        RestContext.request = request;
        // Call the method to test
        Account account = AccountManager.getAccount();
        // Verify results
        System.assert(account != null);
        System.assertEquals('Test Account', account.Name);
        System.debug(account);
    }

    static Id createTestAccount() {
        // Create test account
        Account accountTest = new Account(
                Name = 'Test Account',
                AccountNumber = '123',
                Phone = '375172020329');

        insert accountTest;

        // Create test record
        Contact contact = new Contact(
                FirstName = 'Anya',
                LastName = 'abc',
                Phone = '111',
                AccountId = accountTest.Id
        );
        insert contact;

        return accountTest.Id;
    }
}