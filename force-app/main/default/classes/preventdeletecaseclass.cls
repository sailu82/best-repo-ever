public class preventdeletecaseclass{

    public static void preventcasemethod(list<case> lstofcase)
     {
      for( case caserecord : lstofcase)
        {
        if(caserecord.status =='New')
        {
      caserecord .adderror('you can not delete case');
        }
        }
     }
}