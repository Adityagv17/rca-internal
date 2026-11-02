public with sharing class ProjectTrackerHandler {
    public static void validateProjects(List<Project_Tracker__c> projects) {
        for (Project_Tracker__c p : projects) {
            if (p.Budget__c != null && p.Budget__c < 0) {
                p.Budget__c.addError('Budget cannot be a negative value.');
            }
        }
    }
}