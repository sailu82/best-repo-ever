public class createCase{
 @AuraEnabled
    public static string createcase1(Case caseobj){
        //system.debug('Case::'+caseobj.LastName);
        insert caseobj;
        return caseobj.Id;
    }

}