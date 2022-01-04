public class attchmentClass{
public static void attchemntdeletionmethod(list<attachment> lstofattchments)

{  
   map<id,case> mapofCases = new map<id,case>();
   set<id> attachmentparentid = new set<id>();
   for(attachment attachemntObj: lstofattchments){  
   attachmentparentid.add(attachemntObj.parentid);
  system.debug('@@@ attachment id :' +attachmentparentid);
  }
  for(case caserecord : [select id from case where id IN : attachmentparentid])
    {
     mapofCases.put(caserecord.id,caserecord);
     }
      system.debug('@@@ map of cases :' + mapofCases);
    for( attachment attachmentrecord :lstofattchments)
    {
    system.debug('@@@ contains key :' + mapofCases.containskey(attachmentrecord.parentid )); 
    
    if(mapofCases.containskey(attachmentrecord.parentid ))
    {
       attachmentrecord .adderror('you can not delete case');
     }
}
  }
  }