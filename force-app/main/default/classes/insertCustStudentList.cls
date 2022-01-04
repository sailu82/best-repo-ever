public class insertCustStudentList {
    public void insertStudentRecords(){
        List<Student1__c> lstofStudent = new list<Student1__c>();
        Student1__c stdList;
 stdList = new Student1__c(Name='StudentName1',phone_number__c='1111111111', Status__c='Active', Joining_Date__c= date.parse('09/7/2021'), email_address__c='student1@gmail.com');
 lstofStudent.add(stdList);
        system.debug(stdList);
        stdList = new Student1__c(Name='StudentName2',phone_number__c='2222222222', Status__c='Inactive', Joining_Date__c= date.parse('09/8/2021'), email_address__c='student2@gmail.com');
 lstofStudent.add(stdList);
        stdList = new Student1__c(Name='StudentName3',phone_number__c='23232323232', Status__c='Active', Joining_Date__c= date.parse('09/9/2021'), email_address__c='student3@gmail.com');
 lstofStudent.add(stdList);
        stdList = new Student1__c(Name='StudentName4',phone_number__c='12121212121', Status__c='Inactive', Joining_Date__c= date.parse('09/10/2021'), email_address__c='student4@gmail.com');
 lstofStudent.add(stdList);
        stdList = new Student1__c(Name='StudentName5',phone_number__c='14141414141', Status__c='Inactive', Joining_Date__c= date.parse('09/11/2021'), email_address__c='student6@gmail.com');
 lstofStudent.add(stdList);
  insert lstofStudent;
       
    }

}