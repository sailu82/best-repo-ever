public with sharing class ToDoListController {
    @AuraEnabled(cacheable=true)
    
    public static List<Task> getTasks() {
return [select subject from task where ownerId =: UserInfo.getUserId() ];
    }
    @AuraEnabled
    public static Task insertTask(string subject){
        try {
            Task task =new Task( 
            Subject =subject,
            ownerId = UserInfo.getUserId(),
            Status = 'Not Started',
            Priority ='Normal'
            );
            insert task;
            return task;
            
        } catch (Exception e) {
          System.debug(e.getMessage());  
        }
        return null;
    }
    @AuraEnabled
    public static Boolean deleteTask(Id recordId){
        try {
            Database.delete(recordId);
            return true;
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
        return false;
    }
}