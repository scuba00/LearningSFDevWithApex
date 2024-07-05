 
public class LearningSFDevAPI {
    //Updated method signature to return our Message class
    public static List<Message> getMessages() {
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.learnsfdevwithapex.com/messages');
        //req.setEndpoint('callout:LearningSFDevAPI/messages');
        
        Http http = new Http();
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200) {
                //Here we deserialize the response body into our Message class
                List<Message> messages = (List<Message>)(JSON.deserialize(res.getBody(), List<Message>.class));
                return messages;
        } else {
                throw new LearningSFDevAPIException('API callout returned with a status of ' + res.getStatus());
        }

    }

    public static void sendMessage(Message msg) {
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint('https://api.learnsfdevwithapex.com/messages');
        //req.setEndpoint('callout:LearningSFDevAPI/messages');
        req.setBody(JSON.serialize(msg));
        req.setHeader('X-Auth-Token', 'LearningSFDevAPI');
        req.setHeader('content-type', 'application/json');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if(res.getStatusCode() != 200) {
            throw new LearningSFDevAPIException('API callout returned with a status of ' + res.getStatus());
        }
    }

    public class Message {
        public String id;
        public String body;
        public Date posted;
        public String sender;
        public String location;
        public String email;
        public Boolean test;
    }

}    