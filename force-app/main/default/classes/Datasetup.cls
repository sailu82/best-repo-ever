public class Datasetup{
public static Client__c clientinsertion(){
Client__c clientobj =new Client__c();
clientobj.Name='clent6';
return clientobj;
}

public static Account Accountinsertion(Client__c clientobj){
Account accrecord = new Account();
accrecord.Name = 'tesing';
accrecord.Phone ='1234567891';
accrecord.Rating = 'Hot';
return accrecord;
}
public static case Caseinsertion(Account accobj){
Case caserecord = new case();
caserecord.Accountid = accobj.id;
caserecord.status = 'New';
return caserecord;
}
}