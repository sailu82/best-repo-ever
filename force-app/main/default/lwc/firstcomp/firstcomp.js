import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = '';
  Firstname ='';
  changeHandler(event) {
    this.greeting = event.target.value;
    //this.Firstname = event.target.value;
  }
  clickHandler(event){
      this.Firstname = event.target.value;
  }
}