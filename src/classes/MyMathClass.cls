public class MyMathClass {
    
    private static final Double PI = 3.14159;
    
    public static void addTwoIntegers(Integer num1, Integer num2) {
        System.debug(num1 + num2);
    }
    
    public static void multiplyTwoIntegers(Integer num1, Integer num2) {
        System.debug(num1 * num2);
    }
    
    public static void getCircumference(Double radius) {
        System.debug(2 * PI * radius);
    }
}