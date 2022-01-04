import { LightningElement,api,track } from 'lwc';

export default class ChildY extends LightningElement {
    

    @track trackParam = "trackValue";
    @api apiParam = "apiValue";
    nonReactiveProp = "nonReactiveValue";

    handleparamValues(){
       this.trackParam = "value changed for trackParam";
       this.apiParam = "Value changed for APIParam";
       this.nonReactiveProp = "value changed fro non reactive Param";
    }

}