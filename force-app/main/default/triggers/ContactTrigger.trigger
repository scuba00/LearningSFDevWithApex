trigger ContactTrigger on Contact (before insert) {
    for(Contact con : Trigger.new){
        if(con.Phone == null && con.MobilePhone == null){
            con.addError('One of either phone or mobile phone must be populated.');
        } else if(con.Phone == null && con.MobilePhone != null){
            con.Phone = con.MobilePhone;
        }
    }
}