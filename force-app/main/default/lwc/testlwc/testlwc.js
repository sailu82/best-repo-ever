import { LightningElement,track } from 'lwc';

export default class HelloConditionalRendering extends LightningElement {
    areDetailsVisible = false;
    @track fullName;
    @track Occupation;
   //@track Age;

   handleClick(event)
   {
       console.log(event.target.label);
       var inp=this.template.querySelector("lightning-input");


       inp.forEach(function(element){
           if(element.name=="input1")
               this.fullName=element.value;

           else if(element.name=="input2")
               this.Occupation=element.value;
       },this);
   }
    
}