public class stdController {
     @AuraEnabled
    public static void createstd(Student1__c stdobj){
        insert stdobj;
        //return stdobj.Id;
    }
    @AuraEnabled
    public static list<Student1__c> checkMethod(){
        list<Student1__c> s1 =[select id,Student_Firstname__c,phone_number__c, email_address__c from Student1__c limit 20 ];
        return s1;
    }
   
}