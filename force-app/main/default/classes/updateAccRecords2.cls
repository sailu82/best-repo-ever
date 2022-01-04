public class updateAccRecords2 {
    public static void updateAcc2(){
        Account accobj = [SELECT Id, Name, AnnualRevenue, Rating FROM Account];
        if(accobj.AnnualRevenue>=5000000){
            accobj.Rating = 'Hot';      
        }
        update accobj;
    }

}