import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class CustomCreateLwc extends LightningElement {
    strName;
    strAccountNumber;
    strPhone;
    // Change Handlers.
    nameChangedHandler(event){
        this.strName = event.target.value;
    }
    numberChangedHandler(event){
        this.strAccountNumber = event.target.value;
    }
    phoneChangedHandler(event){
        this.strPhone = event.target.value;
    }
    // Insert record.
    createAccount(){
        // Creating mapping of fields of Account with values
        var fields = {'Name' : this.strName, 'SSN__c' : this.strAccountNumber, 'Phone_Number__c' : this.strPhone};
        // Record details to pass to create method with api name of Object.
        var objRecordInput = {'apiName' : 'AccountP__c', fields};
        // LDS method to create record.
        createRecord(objRecordInput).then(response => {
            alert('Account created with Id: ' +response.id);
        }).catch(error => {
            alert('Error: ' +JSON.stringify(error));
        });
    } 
}