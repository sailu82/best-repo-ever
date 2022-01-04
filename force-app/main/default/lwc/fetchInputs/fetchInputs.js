import { LightningElement,track } from 'lwc';

export default class FetchInputs extends LightningElement {
   //using property
    @track name;
    nameChange(event) {
        this.name= event.target.value;
    }
    //using getter method
    @track name;
    nameChange(event) {
        if(event.target.name=='inp1')
            this.name= event.target.value;
    }
    get userName()
    {
        return this.name;

    }
}