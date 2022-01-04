import { LightningElement, wire,track } from 'lwc';
import getAcc from '@salesforce/apex/AccountControllerCls.getAcc';
export default class DispalyDataWireCmp extends LightningElement {
    totalAccounts
    visibleAccounts
    @wire(getAcc)
    wiredaccount({error, data}){
        if(data){ 
            this.totalAccounts = data
            console.log(this.totalAccounts)
        }
        if(error){
            console.error(error)
        }
    }

    updateContactHandler(event){
        this.visibleContacts=[...event.detail.records]
        console.log(event.detail.records)
    }
    updateAccountHandler(event){
        this.visibleAccounts=[...event.detail.records]
        console.log(event.detail.records)
    }
}