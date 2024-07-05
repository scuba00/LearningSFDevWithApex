// Declare a Set<Id> to hold Contacdt Ids
Set<Id> contactIds = new Set<Id>();

// Perform SOQL query to retrieve Contact Records
List<Contact> contacts = [SELECT Id FROM Contact];

//Iterate through the query results and add Contact Ids to the Set
for(Contact con : contacts){
    contactIds.add(con.Id);
}

List<AggregateResult> results = [SELECT WhoId, COUNT(Id) number FROM Task
    WHERE IsClosed = false AND WhoId IN :contactIds GROUP BY WhoId
    ];

System.debug('results = ' + results.size());

for(AggregateResult res : results) {
    System.debug('For the contact with Id ' + res.get('WhoId') + ' we have '
    + res.get('number') + ' of open tasks'
    );
}
