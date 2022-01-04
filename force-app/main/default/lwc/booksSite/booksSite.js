import { LightningElement } from 'lwc';
import childhtml from './child.html';
import adulthtml from './adult.html';
export default class BooksSite extends LightningElement {
    childuser = false;
    render(){
        return this.childuser ? childhtml: adulthtml;
    }
}