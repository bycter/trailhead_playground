trigger CompleteFieldCreateTime on Unique_customer__c (before insert) {
    Unique_customer__c customer = Trigger.new[0];
    
    customer.Create_Time__c = datetime.now();
}