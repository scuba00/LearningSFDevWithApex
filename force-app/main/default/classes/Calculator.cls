public with sharing class Calculator {
    public static Integer add(Integer item1, Integer item2) {
        if(item1 == null || item2 == null) {
            throw new CalculatorException('You cannot use null as a parameter');
        }
        return item1 + item2;
    }
}
    