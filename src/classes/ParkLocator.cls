/**
 * Created by d.yoshchik on 23.8.18.
 */

public class ParkLocator {
    public static String[] country(String countryName){
        ParkService.ParksImplPort implPort = new ParkService.ParksImplPort();
        return implPort.byCountry(countryName);
    }
}