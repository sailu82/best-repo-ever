import { LightningElement, track,wire } from 'lwc';
import getTasks from '@salesforce/apex/ToDoListController.getTasks'; 
import {refreshApex} from '@salesforce/apex';
import insertTask from '@salesforce/apex/ToDoListController.insertTask';
import deleteTask from '@salesforce/apex/ToDoListController.deleteTask';
export default class Todo extends LightningElement {
    @track
    todoTasks = [];
    todoTasksResponse;
    newTask = '';
updateNewTask(event)
{
    console.log('method called');
    this.newTask = event.target.value;
}
addTaskToList()
{
    insertTask({subject: this.newTask})
    .then(result => {
        console.log(result);
        this.todoTasks.push(
            {
                id:this.todoTasks.length + 1,
                name:this.newTask,
                recordId: result.Id
            }
        );
        this.newTask = '';  
    })
    .catch(error => console.log(error));
    
}
deleteTaskFromList(event)
{
    //console.log('name1:'+event.target.);
let idToDelete = event.target.name;
let todoTasks = this.todoTasks;
let todoTaskIndex;
let recordIdToDelete;
for(let i=0; i<this.todoTasks.length; i++){
    if(idToDelete === this.todoTasks[i].id){
        todoTaskIndex = i;
    }
}
recordIdToDelete = todoTasks[todoTaskIndex].recordId;
console.log(recordIdToDelete);
deleteTask({recordId:recordIdToDelete})
    .then(result => 
        {
        console.log(result);
        this.todoTasks.splice(todoTaskIndex, 1);
           })
    .catch(error => console.log(error));


}
@wire(getTasks)
getTodoTasks(response){
    this.todoTasksResponse = response;
    let data = response.data;
    let error = response.error;
    if(data){
        this.todoTasks =[];
        data.forEach(task => {
            this.todoTasks.push({
                id: this.todoTasks.length+1,
                name: task.Subject,
                recordId: task.Id
            });
            
        });
    }else if(error){
console.log(error);
    }
}
refreshTodoList(){
    //*it will refresh the data in browser cache only if there is a change on the server side */ 
    refreshApex(this.todoTasksResponse);
}

}