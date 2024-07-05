// Declare a Set<Id> to hold Contacdt Ids
Set<Id> contactIds = new Set<Id>();

// Perform SOQL query to retrieve Contact Records
List<Contact> contacts = [SELECT Id FROM Contact];

//Iterate through the query results and add Contact Ids to the Set
for(Contact con : contacts){
    contactIds.add(con.Id);
}

List<Task> tasks = [SELECT Id from Task WHERE IsClosed = false AND WhoId IN :contactIds];
System.debug('contactIds = ' + contactIds.size());
System.debug('tasks = ' + tasks.size());