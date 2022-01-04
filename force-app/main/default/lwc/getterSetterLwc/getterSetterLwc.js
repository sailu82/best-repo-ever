import { LightningElement, track } from 'lwc';

export default class GetterSetterLwc extends LightningElement {
 name = "Cat";
 originalAge= 1;
 newAge= 0;

   get age(){
     if(this.originalAge>20){
         //this.originalAge=20;
         return 20;
     }  
    return this.originalAge;
}

set age(value){

    this.originalAge = value;
}
 UpdateAge(event){
     this.newAge =event.target.value;
 }
 updateOriginalAge(){
   this.age= this.newAge;
 }
}