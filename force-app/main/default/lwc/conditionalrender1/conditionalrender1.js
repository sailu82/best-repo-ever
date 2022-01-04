import { LightningElement } from 'lwc';

export default class Conditionalrender1 extends LightningElement {
   areDetailsvisible =false;  
    handleChange(event){
      this.areDetailsvisible = event.target.checked;
}}