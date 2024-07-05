List<AggregateResult> results = [SELECT COUNT(Id) number, AVG(AnnualRevenue) average FROM Account];

//We know we will only retrieve a single row here as we are not grouping as we will see shortly

System.debug('Number of records = ' + results[0].get('number'));

System.debug('Average Annual Revenue = ' + results[0].get('average'));