public class insertContactRec {
    public static void contactRecMethod(){
         list<Contact> Obj1 = new list<Contact>();
        for(integer i=0; i<=10; i++){
            Contact conObj = new Contact();
            conObj.LastName = 'Lastname'+string.valueof(i);
            conObj.LeadSource ='Web';
            conObj.Phone = '9811119999'+string.valueof(i);
            conObj.DoNotCall = TRUE;
            conObj.Email = 'testemailid@gmail.com'+string.valueof(i);
            Obj1.add(conObj);
            
        }
        insert Obj1;
    
    }

    }