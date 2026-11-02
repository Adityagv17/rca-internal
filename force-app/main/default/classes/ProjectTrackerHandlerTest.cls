@isTest
private class ProjectTrackerHandlerTest {
    @isTest
    static void testPositiveBudget() {
        Project_Tracker__c proj = new Project_Tracker__c(Name = 'Test Proj', Status__c = 'In Progress', Budget__c = 1000);
        Test.startTest();
        insert proj;
        Test.stopTest();
        System.assertNotEquals(null, proj.Id);
    }

    @isTest
    static void testNegativeBudget() {
        Project_Tracker__c proj = new Project_Tracker__c(Name = 'Test Proj', Status__c = 'In Progress', Budget__c = -500);
        Test.startTest();
        try {
            insert proj;
            System.assert(false, 'Expected validation error');
        } catch (Exception e) {
            System.assert(e.getMessage().contains('Budget cannot be a negative value'));
        }
        Test.stopTest();
    }
}