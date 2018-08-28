/**
 * Created by d.yoshchik on 23.8.18.
 */
@IsTest
private class ParkLocatorTest {
    @IsTest
    static void testCallout() {
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String country = 'India';
        String[] listOfParks = ParkLocator.country(country);
        // Verify that a fake result is returned
        String[] countryParks = new String[]{
                'Anamudi Shola National Park',
                'Anshi National Park',
                'Bandipur National Park'
        };
        System.assertEquals(countryParks, listOfParks);
    }
}