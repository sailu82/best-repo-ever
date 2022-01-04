public class contactUpsetClass {
    public static void conatctUpsertMethod(){
        list<contact> contList = [SELECT Id, FirstName, LastName from Contact
                                  where FirstName ='Andy' AND LastName= 'Young']; 
        for(Contact c :contList){
            c.FirstName = 'John';
            c.LastName ='Roy';
        }
        Contact contObj = new Contact(FirstName ='Lori1', LastName= 'Johnson');
        contList.add(contObj);
        upsert contList;
        system.debug(contList);
    }
}