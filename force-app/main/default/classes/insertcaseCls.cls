public with sharing class insertcaseCls {
    public static void insertMethod(list<account> actList){
        list<case> lstCase = new list<case>();
   for( Account a : actList)
   {
       lstCase.add(new case(accountid = a.Id,status ='New'));
   }
    insert lstCase;
    }

}