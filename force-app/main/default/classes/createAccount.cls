public class createAccount {
    @AuraEnabled
    public static string createAccount1(Account accobj){
        system.debug('Account::'+accobj.Name);
        insert accobj;
        return accobj.Id;
    }
      @AuraEnabled
    public static List<String> getIndustry(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Account.Industry.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        return options;
    }

}