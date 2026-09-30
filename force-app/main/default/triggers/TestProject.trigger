trigger TestProject on Test_Project__c (before insert) {
    TestProjectHandler.handleProjects(Trigger.new);

}