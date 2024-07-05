public without sharing class TaskTriggerHandler {

    private static final String KEY_PREFIX = Contact.sObjectType.getDescribe().getKeyPrefix();

    private Boolean isContactId(Id recordId){
        return String.valueOf(recordId).startsWith(KEY_PREFIX);
    }

    private Map<Id, Contact> retrieveContacts(Set<Id> contactIds){
        return new Map<Id, Contact>([SELECT Id, No_of_Open_Tasks__c FROM Contact WHERE Id in :contactIds]);
    }

    public void afterInsert(List<Task> newTasks){
        Set<Id> contactIds = new Set<Id>();
        for (Task t: newTasks) {
            if(t.WhoId != null 
                //&& String.valueOf(t.WhoId).startsWith(KEY_PREFIX)) {
                && isContactId(t.WhoId)) {
                    contactIds.add(t.WhoId);
            }
        }

        Map<Id, Contact> contactMap = retrieveContacts(contactIds);

        // This initializes field to 0 if null so that next loop can add +=1 to the value.
        for(Contact con: contactMap.values()) {
            if(con.No_of_Open_Tasks__c == null){
                con.No_of_Open_Tasks__c = 0;
            }
        }

        for (Task t : newTasks) {
            if(contactMap.containsKey(t.WhoId)) {
                contactMap.get(t.WhoId).No_of_Open_Tasks__c += 1;
            }
        }

        update contactMap.values();
    }

    public void afterUpdate(List<Task> newTasks, Map<Id, Task> oldTaskMap){
        Set<Id> contactIds = new Set<Id>();
        for(Task t: newTasks) {
            if(t.IsClosed 
                && !oldTaskMap.get(t.Id).IsClosed 
                && t.WhoId != null 
                //&& String.valueOf(t.WhoId).startsWith(KEY_PREFIX)) {
                && isContactId(t.WhoId)) {
                    contactIds.add(t.WhoId);
            }
        }

        Map<Id, Contact> contactMap = retrieveContacts(contactIds);

        for(Contact con: contactMap.values()) {
            con.No_of_Open_Tasks__c = 0;
        }


        for(AggregateResult ar: [SELECT WhoId, COUNT(Id) total FROM Task WHERE IsClosed = false AND WhoId in :contactIds GROUP BY WhoId]) {
            String who = String.valueOf(ar.get('WhoId'));
            Decimal total = (Decimal)(ar.get('total'));
            contactMap.get(who).No_of_Open_Tasks__c = total;
        }
        update contactMap.values();
    }
}