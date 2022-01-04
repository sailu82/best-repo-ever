import { LightningElement } from 'lwc';
import getAccounts1 from '@salesforce/apex/AccountSearchController.fetchAccounts1';
export default class AccountSearch extends LightningElement 
{
    accountName;
    accounts;
    handleNameCahnge(event){
        console.log('value is', event.target.value);
        this.accountName = event.target.value;
        this.invokeAccountData();
    }
    handleClick(event){
        this.invokeAccountData();
        /*getAccounts1({
            accountName : this.accountName
        })
        .then((result) => {
            console.log('apex result', result);
            this.accounts = result;

        });*/
    }
    invokeAccountData(){
        getAccounts1({
            accountName : this.accountName
        })
        .then((result) => {
            console.log('apex result', result);
            this.accounts = result;

        });  
    }
    handleSelect(event){

        console.log(event.target.name);
        
    }
}