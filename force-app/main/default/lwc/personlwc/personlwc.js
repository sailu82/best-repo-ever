import { LightningElement,track,api } from 'lwc';

export default class Personlwc extends LightningElement {
    @api location;
   @track user = {
        firstName: 'Sailaja',
        lastName: 'Rani'
    };

    @api updateUser(){
        //this.user={
          // firstName:'Viraat',
         //  lastName: 'reddy' 
       // };
       this.user.firstName ='sreedhar';
    }
}