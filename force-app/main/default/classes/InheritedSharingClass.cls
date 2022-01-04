public inherited sharing class InheritedSharingClass{
    public List<Account> getAllContacts(){
        return [SELECT Name FROM Account];
    }
}