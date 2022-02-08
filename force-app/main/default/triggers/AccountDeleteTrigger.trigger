trigger AccountDeleteTrigger on Account (before delete) {
    if (Trigger.isAfter){
        //APexa's code
    }
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            //Chandras code
        } else if (Trigger.IsDelete) {
            AccountDeleteTriggerHandler.checkOpportunityOnAccount(Trigger.old);
        }
    }

}