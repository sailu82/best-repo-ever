@isTest
public class leadobjHandlertest {
    public static testMethod void PreDoc(){
        lead l = new lead();
        l.FirstName ='test';
        l.LastName ='test';
        l.Company='SFDC';
        l.Status='Open-Not Contacted';
        insert l;
        lead l1 =[select id,FirstName,LastName from lead where company='SFDC'];
        System.assertEquals(l1.FirstName.ContainsIgnoreCase('Dr'),true);
    }  

}