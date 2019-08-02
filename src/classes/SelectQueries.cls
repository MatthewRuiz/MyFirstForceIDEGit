public class SelectQueries {
    public static List<Account> getAllAccounts() {
        List<Account> accountList = new List<Account>();
        // SOQL Best Practice #1 - Only return the necessary fields.
        accountList = [SELECT Id FROM Account];
  
        return accountList;
    }
    
    // get all contacts
    public static List<Contact> getAllContacts() {       
        return [SELECT Id FROM Contact];
    }
    
    // Get all Accounts with the name 'GenePoint'
    public static List<Account> getGenePointAccounts() {
        return [SELECT Id, Name FROM Account WHERE Name = 'GenePoint'];
    }
    
    // Get all Accounts with speicifed name
    public static List<Account> getAccountsWithName(String name) {
        // Using a variable in a query, which requires a colon(:) is often referred to
        // as unwrapping a variable for use.
        return [SELECT Id, Name FROM Account WHERE Name = :name];
    }
    
    public static List<student__c> getAllEnrolledStudents() {
        return [SELECT Name FROM Student__c WHERE Status__c = 'Enrolled'];
    }
    
    public static List<Student__c> getAllStudentsWithGivenStatus(StudentStatus status) {
        return [SELECT Name FROM Student__c WHERE Status__c = :status.name()];
    }
    
   	// returns the first 5 accounts with more than 100 empoyees
    public static List<Account> getFirstFiveAccountsWithMoreThan100Employees() {
        return [SELECT 
					Name, NumberOfEmployees
                FROM
                	Account
                WHERE 
                	NumberOfEmployees > 100
                ORDER BY
                	Name DESC
               	LIMIT
               		5
               ];
    }
    
    // Relationship query going from child-to-parent
    
	// Get all ClassEnrollments that are for math classes
    public static List<ClassEnrollment__c> getMathCEs() {
        return [SELECT 
                	Name
                FROM 
                	ClassEnrollment__c
                WHERE 
                	Class__r.ClassSubject__c = 'Math'
               ];
    }    
    
    public static List<Account> getAccountsAndTheirContacts() {
        return [SELECT Name, (SELECT Name FROM Contacts) FROM Account];
    }
    
    public static List<ClassEnrollment__c> getCEsForStudent(String name) {
        return [
            SELECT
            	Name
            FROM
            	ClassEnrollment__c
            WHERE 
            	Student__r.Name =: name
        ];
    }  
    
    public static List<Assessment__c> getAssessmentForStudent(String name) {
       	// Find all grades(and their assessment) for a given student
        List<Grade__c> gradesForStudent = [
            SELECT
            	Assessment__c 
            FROM 
            	Grade__c 
            WHERE 
            	Student__r.Name =: name];
        
        // Store all Assessment Ids for the given list of Grades
		List<Id> assessmentIds = new List<Id>();        
        for(Grade__c g : gradesForStudent) {
            assessmentIds.add(g.Assessment__c);
        }
        // Use the Assessment Ids to query for the Assessment records
       	return [SELECT Id, Name FROM Assessment__c WHERE Id IN :assessmentIds ];
    }  
    
    
}