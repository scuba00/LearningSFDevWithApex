@isTest
private class LearningSFDevAPI_Test {

    @isTest
    private static void testGetMessages() {
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();

        mock.setStaticResource('ExampleMessagesResponse');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        
        Test.setMock(HttpCalloutMock.class, mock);

        List<LearningSFDevAPI.Message> messages = LearningSFDevAPI.getMessages();
        System.assertEquals(1, messages.size(), 'Incorrect number of messages returned');
    }

    @isTest
    private static void testGetMessagesException() {

        LearningSFDevAPIMock mock = new LearningSFDevAPIMock();
        Test.setMock(HttpCalloutMock.class, mock);
        try {
            List<LearningSFDevAPI.Message> messages = LearningSFDevAPI.getMessages();
            System.assert(false);
        } catch(LearningSFDevAPIException ex) {
            System.assert(ex.getMessage().contains('I\'m a teapot'), ex.getMessage());
        }
    }
//#################################

    @isTest
    private static void testSendMessage() {
        MockHttpResponseSendMessage mock = new MockHttpResponseSendMessage();
        Test.setMock(HttpCalloutMock.class, mock);
        
        LearningSFDevAPI.Message msg = new LearningSFDevAPI.Message();

        msg.body= 'Excellent book!';
        msg.sender = 'Conrad Monreal';
        msg.email = 'conrad.monreal@outlook.com';
        msg.location = 'Clovis, CA USA';
        msg.test = true;

        Test.startTest();
        LearningSFDevAPI.sendMessage(msg);
        Test.stopTest();
    }

    @isTest
    private static void testSendMessagesException() {

        MockSendMessage mock = new MockSendMessage();
        Test.setMock(HttpCalloutMock.class, mock);

        LearningSFDevAPI.Message msg = new LearningSFDevAPI.Message();

        msg.body= 'Excellent book!';
        msg.sender = 'Conrad Monreal';
        msg.email = 'conrad.monreal@outlook.com';
        msg.location = 'Clovis, CA USA';
        msg.test = true;
        
        try {
            Test.startTest();
            LearningSFDevAPI.sendMessage(msg);
            Test.stopTest();
            System.assert(false);
        } catch(LearningSFDevAPIException ex) {
            System.assert(ex.getMessage().contains('cmTest'), ex.getMessage());
        }
    }

}