import { LightningElement, track } from 'lwc';

export default class conditionalsIf extends LightningElement {
    @track name;
    @track age;
    handleClick(event)
    {
        console.log(event.target.label);
        var inp=this.template.querySelector("lightning-input");


        inp.forEach(function(element){
            if(element.name=="input1")
                this.name=element.value;

            else if(element.name=="input2")
                this.age=element.value;
        },this);
    }}