@IsTest
public class TestProjectHandlerTest {

    @IsTest
    static void testLowBudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'Low Budget Test',
            Project_Budget__c = 500
        );

        Test.startTest();
        TestProjectHandler.handleProjects(
            new List<Test_Project__c>{ project }
        );
        Test.stopTest();

        System.assertEquals(
            'In-Progress',
            project.Status__c,
            'Budget below 1000 should set status to In-Progress'
        );
    }


    @IsTest
    static void testExactly1000BudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'Pending Budget Test',
            Project_Budget__c = 1000
        );

        Test.startTest();
        TestProjectHandler.handleProjects(
            new List<Test_Project__c>{ project }
        );
        Test.stopTest();

        System.assertEquals(
            'Pending',
            project.Status__c,
            'Budget exactly 1000 should set status to Pending'
        );
    }


    @IsTest
    static void testHighBudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'High Budget Test',
            Project_Budget__c = 5000
        );

        Test.startTest();
        TestProjectHandler.handleProjects(
            new List<Test_Project__c>{ project }
        );
        Test.stopTest();

        System.assertEquals(
            'Completed',
            project.Status__c,
            'Budget above 1000 should set status to Completed'
        );
    }


    @IsTest
    static void testNullBudgetProject() {

        Test_Project__c project = new Test_Project__c(
            Name = 'Null Budget Test'
        );

        Test.startTest();
        TestProjectHandler.handleProjects(
            new List<Test_Project__c>{ project }
        );
        Test.stopTest();

        System.assertEquals(
            'In-Progress',
            project.Status__c,
            'Null budget should set status to In-Progress'
        );
    }


    @IsTest
    static void testMultipleProjects() {

        List<Test_Project__c> projects = new List<Test_Project__c>{
            new Test_Project__c(
                Name = 'Bulk Low',
                Project_Budget__c = 500
            ),
            new Test_Project__c(
                Name = 'Bulk Pending',
                Project_Budget__c = 1000
            ),
            new Test_Project__c(
                Name = 'Bulk High',
                Project_Budget__c = 5000
            )
        };

        Test.startTest();
        TestProjectHandler.handleProjects(projects);
        Test.stopTest();

        System.assertEquals(
            'In-Progress',
            projects[0].Status__c
        );

        System.assertEquals(
            'Pending',
            projects[1].Status__c
        );

        System.assertEquals(
            'Completed',
            projects[2].Status__c
        );
    }
}