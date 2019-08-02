trigger StudentTrigger on Student__c (before insert, after insert) {
    
    // Trigger Context Variables
    // 
    // Trigger.isExecuting - Returns true if the current context for the Apex code
    //      is a Trigger, not a Visualforce page, a Web Service,
    //      or an executeanonymous() API call. 
    // 
    // Trigger.isInsert - Returns true if this trigger was fired due to an insert operation
    // Trigger.isUpdate - REturns true if this trigger was fired due to an update operation
    // Trigger.isDelete - REturns true if this trigger was fired due to an delete operation
    // Trigger.isUndelete - ...
    // 
    // Trigger.isBefore - Return true if this trigger was fired before any record was saved
    // Trigger.isAfter -  Return true if this trigger was fired after all records were saved
    // 
    // Trigger.new - Returns a list of the new versions of the sObject records
    // Trigger.old - Returns a list of the old versions of the sObject records
    // 
    // Trigger.newMap - A map of IDs to the new versions of the sObject records.
    // Trigger.oldMap - A map of IDs to the old versions of the sObject records.
   
    if (Trigger.isBefore) {
        if(Trigger.isInsert) {
            StudentValidator.validatePhoneNumber(Trigger.new);
        } else if (Trigger.isUpdate) {

        }
    } else {
        if(Trigger.isInsert) {
            
        }
    }
}