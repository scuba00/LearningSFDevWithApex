public with sharing class MockErrorResponse implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
        // Create a new HTTPResponse
        HttpResponse res = new HttpResponse();
        
        // Set the status code to simulate an error
        res.setStatusCode(500);
        res.setBody('{"message": "error"}');
        
        return res;
    }
}