public class Queueabel_Opp_Attachment implements Queueable {
 
  public List<Opportunity> oppList ;
  public integer insertCount;
  public Queueabel_Opp_Attachment(List<Opportunity>oppList, integer insertCount){
  this.oppList = OppList;
  this.insertCount = insertCount;
  }
  public void execute(queueablecontext qc)
  {
  // logic to insert 5500 records
 list<attachment> lstattachment = new list<attachment>(); // created the list here , or atleast need to intialize here before using.
  system.debug('input list size is:'+OppList.size()); // system debug to display values in the log.
 
  integer currentRunInsert = insertCount >5500 ? 5500:insertCount;//it will set the current insertion count to 5500
  for(integer i=1;i<=currentRunInsert;i++)
  {
  //set your Asseet values here.
  Attachment Att = new Attachment();
  Att.ParentId = oppList[0].Id; 
  Att.Name = oppList[0].Name;
       Att.Body = Blob.valueOf(oppList[0].Name);
                    Att.Name = String.valueOf('test.txt');
                    Att.ContentType='text/palin';
  lstattachment.add(Att);
  }
  insert lstattachment;
  insertCount = insertCount-currentRunInsert;// It determines how many more need to be inserted.
  if (insertCount >0){
  system.enqueueJob( new Queueabel_Opp_Attachemnt1 (OppList,insertCount));
  }
 
  }
 
}