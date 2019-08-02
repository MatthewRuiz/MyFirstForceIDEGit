public class AccountValidator {
    // Using Trigger.oldMap
    public static void preventDeletionIfAccountHasChildren(Map<Id, Account> accounts) {
        // Using the keyset of accounts, query for the Contacts for each Account using a sub-query
        List<Account> accountsAndTheirContacts = [SELECT 
                                                  	Id,
                                                  	(SELECT Id FROM Contacts)
                                                  FROM
                                                  	Account
                                                  WHERE
                                                  	Id IN :accounts.keySet()];
        
        // Loop through the retrieved accounts and if their Contacts field is anything other than 0, prevent deletion
        for(Account a: accountsAndTheirContacts) {
            if(a.Contacts.size() > 0) {
                accounts.get(a.Id).addError('This Account has Contacts that are children. Please re-parent these Contacts before deleting.');
            }
        }
    }
    
    public static void preventDeletionIfAccountHasChildrenList(List<Account> accounts) {
        // Used to query for Account records and their Contacts
        List<Id> accountIds = new List<Id>();
        for(Account a : accounts) {
            accountIds.add(a.Id);
        }
        
        List<Account> accountsAndTheirContacts = [SELECT 
                                                  	Id,
                                                  	(SELECT Id FROM Contacts)
                                                  FROM
                                                  	Account
                                                  WHERE
                                                  	Id IN :accountIds];
        for(Account a : accountsAndTheirContacts) {
            System.debug('accountsAndTheirContacts: ' + a.Contacts);            
        }
        Set<Id> accountsThatShouldNotBeDeleted = new Set<Id>();
        
        for(Account a : accountsAndTheirContacts) {
            if(a.Contacts.size() > 0) {
                accountsThatShouldNotBeDeleted.add(a.Id);
            }
        }
        
        for(Account a : accounts) {
            for(Id accountToPreventDeletion : accountsThatShouldNotBeDeleted) {
                if (a.Id == accountToPreventDeletion) {
                    a.addError('This Account has Contacts that are children. Please re-parent these Contacts before deleting.');
                }
            }
        }
        
        
        
    }
}