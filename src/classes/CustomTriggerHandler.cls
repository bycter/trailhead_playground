/**
 * Created by d.yoshchik on 28.8.18.
 */

public class CustomTriggerHandler extends TriggerHandler {

    @TestVisible
    private static final List<String> strBodyList = new List<String>();

    @TestVisible
    protected override void beforeInsert() {

        for (AVery_unique_customer__c customer : (List<AVery_unique_customer__c>) Trigger.new) {
            String strBody = 'The record is created:\n';
            strBody += customer.First_Name__c + ' ' + customer.Last_Name__c + ', ' + customer.Email__c;
            strBodyList.add(strBody);
        }
        CalloutToSlack.sendListString(strBodyList);
    }


    @TestVisible
    protected override void beforeUpdate() {

        String strBody = 'The record is edited:\n';


        for (AVery_unique_customer__c customer : (List<AVery_unique_customer__c>) Trigger.new) {


            AVery_unique_customer__c oldCustomer = (AVery_unique_customer__c) Trigger.oldMap.get(customer.Id);

            if (customer.First_Name__c != oldCustomer.First_Name__c) strBody += oldCustomer.First_Name__c + '(old) -> ' + customer.First_Name__c + '(new)\n';
            if (customer.Last_Name__c != oldCustomer.Last_Name__c) strBody += oldCustomer.Last_Name__c + '(old) -> ' + customer.Last_Name__c + '(new)\n';
            if (customer.Email__c != oldCustomer.Email__c) strBody += oldCustomer.Email__c + '(old) -> ' + customer.Email__c + '(new)\n';

            strBody += customer.First_Name__c + ' ' + customer.Last_Name__c + ', ' + customer.Email__c;

            strBodyList.add(strBody);
        }
        CalloutToSlack.sendListString(strBodyList);
    }
}