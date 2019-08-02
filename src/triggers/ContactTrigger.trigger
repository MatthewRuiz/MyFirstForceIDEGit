trigger ContactTrigger on Contact (before insert) {
    
    // Since we have a list of Contacts and their fields (Trigger.new),
    // we also receive a list of AccountIds. We just have to extract and store them.
    // Why am I using a set here?
    Set<Id> accountIds = new Set<Id>();
    
    // Extract the Ids
    for(Contact c : Trigger.new) {
        accountIds.add(c.AccountId); // Each Contact has an AccountId    
    }
    
    // Using the accountIds set, we can now get the Accounts we want and the fields we want.
    List<Account> queriedAccountsWithShippingCity = [SELECT ShippingCity FROM Account WHERE Id IN :accountIds];
    
    // Loop through Contacts
    for (Contact c : Trigger.new) {
        // Loop through queried Accounts
        for (Account a : queriedAccountsWithShippingCity){
            // If the Contact's AccountId matches the queried Account's Id,
            // then this Contact is a child of this Account. 
            if (c.AccountId == a.Id) {
                c.mailingCity = c.account.shippingCity;
            }
        }
    }
}