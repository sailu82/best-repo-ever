public class Queueabel_Opp_Asset1 implements Queueable {
 
  public List<Opportunity> oppList ;
  public integer insertCount;
  public Queueabel_Opp_Asset1(List<Opportunity>oppList,integer insertCount){
  this.oppList = OppList;
  this.insertCount = insertCount;
  }
  public void execute(queueablecontext qc)
  {
  // logic to insert 5500 records
  List<Asset> AssetList = new list<Asset>(); // created the list here , or atleast need to intialize here before using.
  system.debug('input list size is:'+OppList.size()); // system debug to display values in the log.
 
  integer currentRunInsert = insertCount >5500 ? 5500:insertCount; //it will set the current insertion count to 5500
 
  for(integer i=1;i<=currentRunInsert;i++)
  {
  //set your Asseet values here.
  Asset Ass = new Asset();
  Ass.AccountId = oppList[0].AccountId;
  Ass.Name = oppList[0].Name;
  AssetList.add(Ass);
  }
  insert AssetList;
  insertCount = insertCount-currentRunInsert;//it will set the current insertion count to 5500
  if (insertCount >0){
  system.enqueueJob( new Queueabel_Opp_Asset(OppList,insertCount));
  }
  }
}