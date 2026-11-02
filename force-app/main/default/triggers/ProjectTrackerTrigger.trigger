trigger ProjectTrackerTrigger on Project_Tracker__c (before insert, before update) {
    if (Trigger.isBefore) {
        ProjectTrackerHandler.validateProjects(Trigger.new);
    }
}