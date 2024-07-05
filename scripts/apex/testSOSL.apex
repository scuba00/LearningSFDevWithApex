List<List<SObject>> searchList = [FIND 'Thomas' IN ALL FIELDS RETURNING Contact(Name)];

for(Contact con : (List<Contact>)searchList[0]){
    System.debug('Id = ' + con.Id + 'Contact Name = ' + con.Name);
}
