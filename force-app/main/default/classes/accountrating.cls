public class accountrating {

    public static void accountratingmethod(){
    
    list<account> accountrecords = new list<Account>();
    accountrecords =[select id,Rating from Account];
    list<opportunity> opprecords = new list<opportunity>();  
        for (Account accrecord :accountrecords )
        {   
        if (accrecord.Rating == 'Hot')
        {
        opportunity oppobj =new opportunity();
          oppobj.accountid =  accrecord.id;
            opprecords.add(oppobj);
        }
       
        }
    if(!opprecords.isempty()){
        system.debug('@@@opprecords :' +opprecords);
        delete opprecords;
    }
    system.debug('@@@@ opplist'+opprecords);
}

}