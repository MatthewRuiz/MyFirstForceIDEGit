@isTest
public class ProjectZeroTests {
    @isTest
    static void testFibonacci() {
        // Single Action - Positive
        System.assertEquals(1, ProjectZero.fibonacci(1));
        System.assertEquals(1, ProjectZero.fibonacci(2));
        System.assertEquals(2, ProjectZero.fibonacci(3));
        System.assertEquals(89, ProjectZero.fibonacci(11));
        System.assertEquals(6765, ProjectZero.fibonacci(20));
        System.assertEquals(196418, ProjectZero.fibonacci(27));
        
        // Single Action - Negative
        System.assertEquals(-1, ProjectZero.fibonacci(-5));
    }
}