@isTest
public class caserecordinsertiontest{
@isTest
private static void insertaccountrecords(){
Client__c clientobj =new Client__c();
clientobj = Datasetup.clientinsertion();
insert clientobj;
Account accobject = new Account();
accobject = Datasetup.Accountinsertion(clientobj);
insert accobject;
accobject .Rating ='Cold';
Update accobject;

}
}