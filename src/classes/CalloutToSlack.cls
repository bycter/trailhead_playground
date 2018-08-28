public with sharing class CalloutToSlack {

    @Future(Callout=true)
    public static void sendListString(List<String> textStringList) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://hooks.slack.com/services/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');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        String setChannel = '"channel": "general",';
        String setUsername = '"username": "Denis SalesWEB",';
        String setEmoji = '"icon_emoji": ":ghost:"';

        for(String textString : textStringList) {

            String setText = '"text": "' + textString + '",';

            String bodyString = '{' + setChannel + setUsername + setText + setEmoji + '}';

            request.setBody(bodyString);

            HttpResponse response = http.send(request);

        }
    }

    public static void forTest(){
        List<AVery_unique_customer__c> customerList = new List<AVery_unique_customer__c>();

        customerList = [SELECT Last_Name__c, First_Name__c, Email__c
            FROM AVery_unique_customer__c
                WHERE Last_Name__c LIKE 'one'
        ];

        List<AVery_unique_customer__c> customerListNew = new List<AVery_unique_customer__c>();

        for (AVery_unique_customer__c customer2 : customerList) {
            customer2.First_Name__c = 'person';
            customerListNew.add(customer2);
        }

        update customerList;
    }
}