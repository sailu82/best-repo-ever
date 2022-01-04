global class listObj {
    
    @Auraenabled(cacheable=true)
    public static List<string> getObjects()
    {
        List<string> sObjectList1 = new List<string>();
        
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String name = objTyp.getDescribe().getName();
            if((!name.containsignorecase('history') && !name.containsignorecase('tag')&&
                !name.containsignorecase('share') && !name.containsignorecase('feed')) && 
               name.toLowerCase().right(3) ==  '__c'){      
                   sObjectList1.add(name);
               }
        }
        system.debug('objects:' +sObjectList1);
        return sObjectList1;
        
    }
   
}