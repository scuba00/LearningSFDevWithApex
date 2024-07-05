@isTest
private with sharing class Calculator_Test {
    @isTest

    private static void testTwoPositiveIntegers() {
        //Setup our test data
        Integer x = 5;
        Integer y = 9;

        //Execute the method we wish to test
        Integer result = Calculator.add(x, y);

        //Assert we get the correct result
        System.assertEquals(14, result, 'Incorrect result returned from add method');
    }

    @isTest
    private static void testNullItemException() {
        //Setup our test data
        Integer x = null;
        Integer y = 9;
    
        //Execute the method we wish to test
        try {
                Integer result = Calculator.add(x, y);
                System.assert(false, 'An exception should have occurred and did not.');
        } catch(CalculatorException ex) {
            System.assertEquals('You cannot use null as a parameter', ex.getMessage(), 'Incorrect exception message returned.');
        }
    }
    
}
