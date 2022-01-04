public class oppclass {
public static void oppmethod(list<opportunity> lstofopportunity)
{
   map<id,account> mapofaccounts = new map<id,account>();
   set<id> opprtunityid = new set<id>();
   for(opportunity opprecord :lstofopportunity)
   {
   opprtunityid .add(opprecord.Accountid);
   }
   for(Account accrecord : [select id, rating from account where id IN :opprtunityid AND rating='Hot'])
   {
   mapofaccounts.put(accrecord.id, accrecord);
   }
   for(opportunity oppobj : lstofopportunity)
   {
   system.debug('@@@ contains key :' + mapofaccounts.containskey( oppobj .Accountid )); 
   
   if(mapofaccounts.containskey( oppobj .Accountid))
   {
   oppobj.adderror('You can not delete opportunity record');
   }
   }
}
}