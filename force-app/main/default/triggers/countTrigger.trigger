trigger countTrigger on Contact ( after insert, after delete) {

  set<id> accid=new set<id>();
 list<contact> listcon=new list<contact>();
 list<account> listAcc=new list<account>();
map<id,integer> mapCount=new map<id,integer>();
 if(trigger.isinsert){
 for(contact con:trigger.new){
 accid.add(con.accountid);
 }
 }
 if(trigger.isdelete){
 for(contact con:trigger.old){
 accid.add(con.accountid);
 }
 }
 list<account> acclist=[select id,name from account where id in:accid];
 list<contact> contactlist = [select id,name,accountid from contact where accountid in:accid];
 for(account acc:acclist){
 listcon.clear();
 for(contact c:contactlist){
 if(c.accountid==acc.id){
 listcon.add(c);
 mapCount.put(c.accountid,listcon.size());
 }
 }
 }
 if(acclist.size()>0){
 for(Account a:acclist){
 if(mapCount.get(a.id)==null)
 a.count_of_conatcts__c=0;
else
 a.count_of_conatcts__c=mapCount.get(a.id);
 listAcc.add(a);
 }
 }
 if(listAcc.size()>0)
 update listAcc;
}