public class studentController {
 @AuraEnabled
    public static string createStudentAccount(Student1__c stuobj){
        system.debug('Student::'+stuobj.Id);
        insert stuobj;
        return stuobj.Id;
    }
}