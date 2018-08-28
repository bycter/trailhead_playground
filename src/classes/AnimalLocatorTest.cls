/**
 * Created by d.yoshchik on 22.8.18.
 */
@isTest
private class AnimalLocatorTest {
    @isTest
    static void testPostCallout() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        String name = AnimalLocator.getAnimalNameById(1);
        System.assertNotEquals(null, name);
    }
}