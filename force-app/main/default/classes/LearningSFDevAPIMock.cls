public with sharing class LearningSFDevAPIMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest req) {
        
        HttpResponse res = new HttpResponse();
        res.setStatusCode(418);
        res.setStatus('I\'m a teapot');
        
        return res;
        
    }
}