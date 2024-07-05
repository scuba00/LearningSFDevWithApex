public with sharing class MockHttpResponseSendMessage implements HttpCalloutMock {
    // This method is called by the HTTP framework to get the mock response
    public HttpResponse respond(HTTPRequest req) {
        
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://api.learnsfdevwithapex.com/messages', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());

        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);
        return res;

    }
}
