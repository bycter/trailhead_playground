/**
 * Created by d.yoshchik on 23.8.18.
 */
@RestResource(UrlMapping='/Accounts/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        Account accountResult = new Account();
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');

        if (!accountId.equals('')) {

            accountResult = [
                    SELECT Id, Name, (SELECT Id,Name FROM Contacts)
                    FROM Account
                    WHERE Id = :accountId
                    LIMIT 1
            ];
        }

        return accountResult;
    }
}