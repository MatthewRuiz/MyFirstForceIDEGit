public class StudentValidator {
    public static void validatePhoneNumber(List<Student__c> students) {
        for(Student__c student : students) {
            if(student.PhoneNumber__c == null) {
                student.addError('Please provide a phone number for: ' + student.Name);
            }
        }
    }
}