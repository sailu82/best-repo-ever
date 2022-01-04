public class leadobjHandler {
    public static void leadobjMethod(list<Lead> leadList){
        for(Lead objL1 : leadList){
            objL1.FirstName = '';
            objL1.FirstName = 'Dr.'+ objL1.FirstName;
           
        }
       
    }

}