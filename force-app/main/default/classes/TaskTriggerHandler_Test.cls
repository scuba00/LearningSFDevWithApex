@isTest
private with sharing class TaskTriggerHandler_Test {
    
    @TestSetup
    private static void setupData() {
        Contact con = new Contact();
        con.FirstName = 'Marco';
        con.LastName = 'Polo';
        con.Phone = '111111111';
        insert con;
    }
    

    @isTest
    private static void testIncrementOnNewTask() {

        //Retrieve our test contact
        Contact con = [SELECT Id FROM Contact LIMIT 1];

        //Create our test task 
        Task t = new Task();
        t.WhoId = con.Id;
        t.Subject = 'Test task';

        //Execute the code we want to test
        Test.startTest();
        insert t;
        Test.stopTest();

        //We need to retrieve the Contact record again to check the value has been updated 
        con = [SELECT No_of_Open_Tasks__c FROM Contact WHERE Id = :con.Id];
        System.assertEquals(1, con.No_of_Open_Tasks__c, 'Incorrect number of open tasks set on contact');
    }

    @isTest
    private static void testDecrementOnClosedTask() {
 
        //Retrieve our test contact
        Contact con = [SELECT Id FROM Contact LIMIT 1];

        //Create our test task
        Task t = new Task();
        t.WhoId = con.Id;
        t.Subject = 'Test task';
        insert t;

        //Let us verify our data is setup correctly
        con = [SELECT No_of_Open_Tasks__c FROM Contact WHERE Id = :con.Id];
        System.assertEquals(1, con.No_of_Open_Tasks__c, 'Incorrect number of open tasks set on contact');
        
        //Now update the task status and commit the change
        t.Status = 'Completed';
        Test.startTest();
        update t;
        Test.stopTest();
        
        //Retrieve the Contact record again to check the value has been updated 
        con = [SELECT No_of_Open_Tasks__c FROM Contact WHERE Id = :con.Id];
        System.assertEquals(0, con.No_of_Open_Tasks__c, 'Incorrect number of open tasks set on contact');
    }
    

}