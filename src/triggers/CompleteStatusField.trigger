trigger CompleteStatusField on Unique_customer__c (before insert, before update) {
    
    for (Unique_customer__c customer : Trigger.new) {
    
        if (Trigger.isInsert) {
            customer.Status_Field__c = 'Created';
        } else if (Trigger.isUpdate) {
            customer.Status_Field__c = 'Updated';
        }
    }
}