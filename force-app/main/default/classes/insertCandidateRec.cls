public class insertCandidateRec {
    public static void createCandidateRec(){
        list<Candidate__c> Obj1 = new list<Candidate__c>();
        for(integer i=0; i<=10; i++){
            Candidate__c candObj = new Candidate__c();
            candObj.First_Name__c = 'Candidate'+string.valueof(i);
            candObj.status__c ='Active';
            candObj.Phone__c = '9811119999'+string.valueof(i);
            candObj.Rejected_Candiadte__c = TRUE;
            candObj.Email__c = 'testemail@gmail.com'+string.valueof(i);
            Obj1.add(candObj);
            
        }
        insert Obj1;
    
    }

}