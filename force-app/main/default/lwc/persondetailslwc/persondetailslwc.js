import { LightningElement } from 'lwc';
 
export default class persondetailslwc extends LightningElement {
    areDetailsVisible = false;

 
    handleChange(event) {
        this.areDetailsVisible = event.target.checked;
    }


}