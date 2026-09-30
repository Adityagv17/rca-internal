public class TestProjectHandler {

    public static void handleProjects(List<Test_Project__c> projects) {

        for (Test_Project__c project : projects) {

            if (project.Project_Budget__c == null) {
                project.Status__c = 'In-Progress';
            }
            else if (project.Project_Budget__c > 1000) {
                project.Status__c = 'Completed';
            }
            else if (project.Project_Budget__c == 1000) {
                project.Status__c = 'Pending';
            }
            else {
                project.Status__c = 'In-Progress';
            }
        }
    }
}