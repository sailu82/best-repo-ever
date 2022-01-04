public class caserecordinsertion
{
  public static void insertcaserecord(list<Account> lstofAccountrecords, Map<Id,Account> mapofoldaccounts)
{
    List<Case> lstofcases ;
    for(account accrecord: lstofAccountrecords)
    {
    Account oldaccount = mapofoldaccounts.get(accrecord.id);
     if(oldaccount.Rating == 'Hot' && accrecord.Rating == 'Cold')
     {
     case caserecord = new case();
     //caserecord.Accountid = accrecord.id;
    // caserecord.status = 'Working';
     //caserecord.Priority = 'Medium';
     caserecord.Origin = 'Phone';
     lstofcases.add(caserecord );
     }
     
}
      if(!lstofcases.isempty())
      insert lstofcases;
}
}