List<LearningSFDevAPI.Message> messages = LearningSFDevAPI.getMessages();

        for (LearningSFDevAPI.Message msg : messages) {
            
            System.debug('==> id = ' + msg.id);
            System.debug('  + posted = ' + msg.posted);
            System.debug('  + sender = ' + msg.sender);
            System.debug('  + location = ' + msg.location);
            System.debug('  + body = ' + msg.body);
            
        }

        System.debug('test_0= ' + messages[0].id);
        System.debug('test_1= ' + messages[1].id);
        System.debug('test_2= ' + messages[2].id);
        System.debug('test_3= ' + messages[3].id);
        System.debug('test_4= ' + messages[4].id);
        System.debug('test_5= ' + messages[5].id);