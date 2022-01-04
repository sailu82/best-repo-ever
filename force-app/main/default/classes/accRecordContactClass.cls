public class accRecordContactClass {
    public static void accConMethod(){
       Account ac1 = new Account(Name='NewAccount2', Rating='Cold');
        insert ac1;
        Id accid = ac1.Id;
        contact cn =new Contact (FirstName='TestFirstName1', LastName='TestLastname1', 
                                 Phone ='123123123', AccountId = accid);
        insert cn;
    }

}