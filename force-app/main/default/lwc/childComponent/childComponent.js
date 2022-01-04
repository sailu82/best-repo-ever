import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api message
    @api className

    get alertClassName() {
        return this.className ? 'alert ' + this.className : 'alert'
    }

}