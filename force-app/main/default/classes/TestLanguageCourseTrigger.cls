@isTest
private class TestLanguageCourseTrigger {
    @isTest static void TestLanguageCourseTrigger() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
        Language_Course__c lng = new Language_Course__c();
        insert lng;
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);
        Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
    
}