import { LightningElement,track } from 'lwc';

export default class OneWayBinding extends LightningElement {
    @track firstname ="Good";
    handleChange(event){
        var result = event.target;
        this.firstname = result.value;
    }

}