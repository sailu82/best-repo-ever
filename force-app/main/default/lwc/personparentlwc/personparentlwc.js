import { LightningElement } from 'lwc';

export default class Personparentlwc extends LightningElement {
    updateUser()
    {
        this.template.querySelector('c-personlwc').updateUser();
    }
}