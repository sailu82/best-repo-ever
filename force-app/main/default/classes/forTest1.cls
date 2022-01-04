public class forTest1 {
public static void soqlForMethod(){
    for(Account acc: [Select Id, Name from Account limit 10]){
       system.debug('Account Name===>' +acc.Name);
    }
}
}