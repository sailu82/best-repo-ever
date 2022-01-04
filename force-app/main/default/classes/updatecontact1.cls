public class updatecontact1 {
    public static void upadtecontactrecords(){
        Contact con = [SELECT Id, Name, MobilePhone FROM Contact where Id='0034x00000UzeGwAAJ'];
        con.MobilePhone = '1234567890';
        update con;
    }

}