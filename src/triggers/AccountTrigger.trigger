trigger AccountTrigger on Account (before delete, after insert) {
    /*
    if(Trigger.isBefore) {
        if(Trigger.isDelete) {
            AccountValidator.preventDeletionIfAccountHasChildrenList(Trigger.old);	
        }
    } else {
        if(Trigger.isInsert) {
            AccountHandler.postToChatterAfterCreation(Trigger.new[0]);
        }
    }
*/}