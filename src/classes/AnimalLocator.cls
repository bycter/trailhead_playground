/**
 * Created by d.yoshchik on 22.8.18.
 */

public class AnimalLocator {
    public static String getAnimalNameById(Integer value) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + value);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        String name;
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

            Map<String, Object> a = (Map<String, Object>) results.get('animal');

            name = (String) a.get('name');

            //System.debug(name);
        }
        return name;
    }
}