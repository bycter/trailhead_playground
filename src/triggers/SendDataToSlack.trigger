trigger SendDataToSlack on AVery_unique_customer__c (after delete, after insert, after update, before delete, before insert, before update) {

    new CustomTriggerHandler().run();

}