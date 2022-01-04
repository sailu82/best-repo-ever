public class contactList1 {
 @AuraEnabled
    public static List<Contact> getContactList(string accountId){
       List<Contact> contactList = new List<Contact>([select Id, FirstName, LastName, Name, Email, Phone from Contact where Email != null AND AccountId =: accountId]);
        return contactList;
    }
}