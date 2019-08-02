public class ExceptionMethods {
    // Hello from Org
    private class MyCustomException extends Exception {}
    
    public static void accountErrors(String name) {
        try {
            List<Account> accs = [SELECT Id FROM Account WHERE Name =: name LIMIT 1];
            String accCity = accs[0].ShippingCity;
        } catch (ListException le) {
            printErrors(le);
        } catch (SObjectException soe) {
            printErrors(soe);
        } catch (Exception e) { // Notice that the most general exception, Exception, is at the bottom
            printErrors(e);
        } finally {
            // Clean up your code
            // Close any connections still open
        }
    }
    
    private static void printErrors(Exception e) {
        SYstem.debug('Exception type caught: ' + e.getTypeName());
        System.debug('Message: ' + e.getMessage());
        System.debug('Cause: ' + e.getCause());
        System.debug('Line Number: ' + e.getLineNumber());
        SYstem.debug('Stack trace: ' + e.getStackTraceString());
    }
    
    public static void testCustomException(String message) { 
        try {
            // THrow a custom exception, not passing a message
            // throw new MyCustomException();
             
            // Throw a custom exception, providing a message
            throw new MyCustomException('hello');
        } catch (MyCustomException mce) {
            printErrors(mce);
        }
    }
    
    public static void parentMethod() {
        try {
            childMethod();
        } catch (MyCustomException mce) {
            printErrors(mce);
        }
    }
    
    public static void childMethod() {
        throw new MyCustomException();
    }
    
    
    
    
}