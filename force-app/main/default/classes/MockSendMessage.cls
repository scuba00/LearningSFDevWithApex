public with sharing class MockSendMessage implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest req) {
        
        HttpResponse res = new HttpResponse();
        res.setStatusCode(666);
        res.setStatus('cmTest: SendMessage Exception');
        
        return res;
        
    }
}