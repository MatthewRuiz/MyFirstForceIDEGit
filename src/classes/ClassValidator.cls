public class ClassValidator {
    public static void checkForDuplicateClasses(List<Class__c> classes) {
        // Single use case below
        /*List<Class__c> existingClasses = [SELECT
Id 
FROM
Class__c
WHERE
Name =: classOfInterest.Name
];

if(existingClasses.size() > 0) {
classOfInterest.addError('There already exists a class with this name.');
}
*/
        
        // Used to find existing classes 
        List<String> newClassNames = new List<String>();
        for(Class__c c : classes) {
            newClassNames.add(c.Name);
        }
        
        // Use list of existing names to get their records
        for(Class__c existingClass : [SELECT Name FROM Class__c WHERE Name IN :newClassNames]) {
            for(Class__c newClass: classes) {
                if (existingClass.Name == newClass.Name) {
                    newClass.addError('There already exists a class with this name.');
                }
            }
        }
        
        //List<Student__c> students = [SELECT Name FROM Student__c WHERE Name IN :newClassNames];
        //for(Student__c s : students) {
        //    
        //}
    }
    
    public static void validateClassNameIsSupportedBySubject(List<Class__c> classes) {
        // Used to check for valid names
        List<String> possibleClassAbbreviations = new List<String> {'HIS', 'MAT', 'ENG', 'BIO', 'PHY', 'CHE'};
            
            for(Class__c newClass : classes) {
                // Store the first three characters of the class name.
                // For example, HIS is store for HIS100
                String classNameAbbreviation = newClass.Name.substring(0,3);
                // Check if new class name is valid
                if(!possibleClassAbbreviations.contains(classNameAbbreviation)) {
                    newClass.addError('Invalid class name');
                }
            }
    }
    
    public static void checkThatCorrectNameInputIsValid(List<Class__c> classes) {
        
        List<String> classSubjects = new List<String>{'HIS','ENG','BIO','CHE', 'PSY'};
            
            // Getting list of New Names
            List<String> newClassTopicNames = new List<String>();
        for(Class__c c : classes) {
            newClassTopicNames.add(c.ClassTopic__c);
        }
        
        // CHecking new names with what in the database
        for(Class__c exisitingName : [SELECT ClassTopic__c FROM Class__c WHERE ClassTopic__C IN :newClassTopicNames]) {
            for(Class__c newClass : classes) {
                String classShortHand = newClass.ClassTopic__c.substring(0,3);
                classShortHand.toUpperCase();
                if(exisitingName.ClassTopic__c == newClass.ClassTopic__c) {
                    newClass.addError('This is not in the System.');
                }
            }
        }   
    }
    
}