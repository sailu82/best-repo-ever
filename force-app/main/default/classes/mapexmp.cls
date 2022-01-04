public class mapexmp {
    
public static void mapPut(){
       
    Map<String,String> currencyMap = new Map<String,String>();
    currencyMap.put('USA', 'USD');
    currencyMap.put('CANADA', 'CAD');
    currencyMap.put('Uniter Kingdom', 'GBP');
       
    for(String key : currencyMap.keySet()) {
    System.debug('Country: '+key+' Currency: '+currencyMap.get(key));
    }
 }
 public static void getMapElements() {
       
    Map<String,String> currencyMap = new Map<String,String>();
    currencyMap.put('USA', 'USD');
    currencyMap.put('CANADA', 'CAD');
    currencyMap.put('Uniter Kingdom', 'GBP');
       
    for(String key : currencyMap.keySet()) {
    System.debug('Country: '+key+' Currency: '+currencyMap.get(key));
    }
 }
    public static void containsKeyTest() {
       
    Map<String,String> currencyMap = new Map<String,String>();
    currencyMap.put('USA', 'USD');
    currencyMap.put('CANADA', 'CAD');
    currencyMap.put('Uniter Kingdom', 'GBP');
       
    System.debug('Contains USA? : '+currencyMap.containsKey('USA'));     
    System.debug('Contains America?: '+currencyMap.containsKey('America'));
 }
 public static void keysetTest() {
       
    Map<String,String> currencyMap = new Map<String,String>();
    currencyMap.put('USA', 'USD');
    currencyMap.put('CANADA', 'CAD');
    currencyMap.put('Uniter Kingdom', 'GBP');
       
    for(String key : currencyMap.keySet()) {
       System.debug('Country : '+key+' has currency : '+currencyMap.get(key));
    }
 }
  
}