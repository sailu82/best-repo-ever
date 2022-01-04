import { LightningElement,track } from 'lwc';

export default class MultipleInputs extends LightningElement {
    @track name;
    @track age;
    @track dateofb;
    @track Email;
    @track Active;
    handleClick(event)
    {
        console.log(event.target.label);
        var inp=this.template.querySelectorAll("lightning-input");


        inp.forEach(function(element){
            if(element.name=="input1")
                this.name=element.value;

            else if(element.name=="input2")
                this.age=element.value;
                else if(element.name=="input3")
                this.dateofb=element.value;
                else if(element.name=="input4")
                this.Email=element.value;
                else if(element.name=="input5")
                this.Active=element.value;
            

        },this);
    }}