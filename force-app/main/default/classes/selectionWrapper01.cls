public with sharing class ContactListController {
    
    //define a public property for our list of wrappers that the UI can use
    public List<ContactWrapper> contacts {get; set;}
    
    //an example constructor to retrieve some contacts to populate our list
    public ContactListController() {
    
        contacts = new List<ContactWrapper>();
        for(Contact con : [SELECT Id, FirstName, LastName FROM Contact LIMIT 20]) {
            contacts.add(new ContactWrapper(con));
        }
    }


    //an example action method, this would be called from a button on the UI
    public PageReference updateSelected() {
    
        for(ContactWrapper wrapper: contacts) {
    
            //this would debug whether for each of our wrappers the checkbox bound to the "selected" //Boolean had been checked
            System.debug(wrapper.con.FirstName + ' ' + wrapper.con.LastName + 'is selected?' + wrapper.selected);
            return null;
        }

    }


    //our inner wrapper class stores the Contact instance and a Boolean indicating it has been selected
    public with sharing class ContactWrapper {
        public Boolean selected {get; set;}
    
        public Contact con {get; set;}
    
        public ContactWrapper(Contact cont) {
            selected = false;
            con = cont;
        }
    }
}