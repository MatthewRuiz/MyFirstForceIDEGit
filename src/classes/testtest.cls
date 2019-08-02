@isTest
public class testtest {
    @isTest(SeeAllData=true) 
    static void viewClasses() {
        User u = [SELECT Id FROM User WHERE Id ='0053i000000SpTXAA0'];
        
        List<Class__c> classes = [SELECT Name FROM Class__c];
        System.debug('Number of classes seen by default: ' + classes.size());
        
        System.runAs(u) {
            classes = [SELECT Name FROM Class__c];
            System.debug('Number of classes seen by Billy Madison: ' + classes.size());
        }
        
        
    }
}