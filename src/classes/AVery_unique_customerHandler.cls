/**
 * Created by d.yoshchik on 28.8.18.
 */

/**
 * Class AVery_unique_customerHandler
 *
 * Trigger Handler for the AVery_unique_customer SObject. This class implements the ITrigger
 * interface to help ensure the trigger code is bulkified and all in one place.
 */
public with sharing class AVery_unique_customerHandler
        implements ITrigger
{
    // Member variable to hold the Id's of Accounts 'in use'
    private List<String> strBodyList = new List<String>();

    // Constructor
    public AVery_unique_customerHandler()
    {
    }

    /**
     * bulkBefore
     *
     * This method is called prior to execution of a BEFORE trigger. Use this to cache
     * any data required into maps prior execution of the trigger.
     */
    public void bulkBefore()
    {
        // If this a delete trigger Cache a list of Account Id's that are 'in use'
        AVery_unique_customer__c oldCustomer;

    }

    public void bulkAfter()
    {
    }

    public void beforeInsert(SObject so)
    {
        AVery_unique_customer__c customer = (AVery_unique_customer__c) so;

        String strBody = 'The record is created:\n';
        strBody += customer.First_Name__c + ' ' + customer.Last_Name__c + ', ' + customer.Email__c;
        strBodyList.add(strBody);
    }

    public void beforeUpdate(SObject oldSo, SObject so)
    {
        String strBody = 'The record is edited:\n';

        AVery_unique_customer__c oldCustomer = (AVery_unique_customer__c) oldSo;
        AVery_unique_customer__c customer = (AVery_unique_customer__c) so;

        if (customer.First_Name__c != oldCustomer.First_Name__c) strBody += oldCustomer.First_Name__c + '(old) -> ' + customer.First_Name__c + '(new)\n';
        if (customer.Last_Name__c != oldCustomer.Last_Name__c) strBody += oldCustomer.Last_Name__c + '(old) -> ' + customer.Last_Name__c + '(new)\n';
        if (customer.Email__c != oldCustomer.Email__c) strBody += oldCustomer.Email__c + '(old) -> ' + customer.Email__c + '(new)\n';

        strBody += customer.First_Name__c + ' ' + customer.Last_Name__c + ', ' + customer.Email__c;

        strBodyList.add(strBody);
    }

    /**
     * beforeDelete
     *
     * This method is called iteratively for each record to be deleted during a BEFORE
     * trigger.
     */
    public void beforeDelete(SObject so)
    {
    }

    public void afterInsert(SObject so)
    {
    }

    public void afterUpdate(SObject oldSo, SObject so)
    {
    }

    public void afterDelete(SObject so)
    {
    }

    /**
     * andFinally
     *
     * This method is called once all records have been processed by the trigger. Use this
     * method to accomplish any final operations such as creation or updates of other records.
     */
    public void andFinally()
    {
        CalloutToSlack.sendListString(strBodyList);
    }
}