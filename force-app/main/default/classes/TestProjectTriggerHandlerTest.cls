@IsTest
public class TestProjectTriggerHandlerTest {

    @IsTest
    static void testLowBudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'Trigger Test - Low Budget',
            Project_Budget__c = 500
        );

        Test.startTest();
        insert project;
        Test.stopTest();

        Test_Project__c result = [
            SELECT Id, Name, Project_Budget__c, Status__c
            FROM Test_Project__c
            WHERE Id = :project.Id
        ];

        System.assertEquals('In-Progress', result.Status__c);
    }

    @IsTest
    static void testMediumBudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'Trigger Test - Medium Budget',
            Project_Budget__c = 1000
        );

        Test.startTest();
        insert project;
        Test.stopTest();

        Test_Project__c result = [
            SELECT Id, Name, Project_Budget__c, Status__c
            FROM Test_Project__c
            WHERE Id = :project.Id
        ];

        System.assertEquals('In-Progress', result.Status__c);
    }

    @IsTest
    static void testHighBudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'Trigger Test - High Budget',
            Project_Budget__c = 5000
        );

        Test.startTest();
        insert project;
        Test.stopTest();

        Test_Project__c result = [
            SELECT Id, Name, Project_Budget__c, Status__c
            FROM Test_Project__c
            WHERE Id = :project.Id
        ];

        System.assertEquals('Completed', result.Status__c);
    }

    @IsTest
    static void testMultipleProjects() {

        List<Test_Project__c> projects = new List<Test_Project__c>{
            new Test_Project__c(
                Name = 'Bulk Test - Low',
                Project_Budget__c = 500
            ),
            new Test_Project__c(
                Name = 'Bulk Test - High',
                Project_Budget__c = 5000
            )
        };

        Test.startTest();
        insert projects;
        Test.stopTest();

        List<Test_Project__c> results = [
            SELECT Id, Name, Project_Budget__c, Status__c
            FROM Test_Project__c
            WHERE Id IN :projects
        ];

        System.assertEquals(2, results.size());

        for (Test_Project__c project : results) {
            if (project.Project_Budget__c <= 1000) {
                System.assertEquals('In-Progress', project.Status__c);
            } else {
                System.assertEquals('Completed', project.Status__c);
            }
        }
    }
}