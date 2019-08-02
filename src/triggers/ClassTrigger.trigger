trigger ClassTrigger on Class__c (before insert, before update) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ClassValidator.checkForDuplicateClasses(Trigger.new);
            ClassValidator.checkThatCorrectNameInputIsValid(Trigger.new);
        } else if(Trigger.isUpdate) {
            ClassValidator.checkForDuplicateClasses(Trigger.new);
            ClassValidator.checkThatCorrectNameInputIsValid(Trigger.new);
        }
    }

}