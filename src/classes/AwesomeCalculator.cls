/**
 * Created by d.yoshchik on 22.8.18.
 */

public class AwesomeCalculator {
    public static Double add(Double x, Double y) {
        calculatorServices.CalculatorImplPort calculator =
                new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x, y);
    }
}