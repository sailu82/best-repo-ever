import { LightningElement,track, wire } from 'lwc';
import getAcc from '@salesforce/apex/AccountControllerCls.getAcc';
//import test from './dataTableWire/test.js';
export default class DataTableWire extends LightningElement {
    @track columns = [{
        label: 'Account name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    },
    {
        label: 'Type',
        fieldName: 'Type',
        type: 'text',
        sortable: true
    },
    {
        label: 'Annual Revenue',
        fieldName: 'AnnualRevenue',
        type: 'Currency',
        sortable: true
    },
    {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
        sortable: true
    },
    {
        label: 'Website',
        fieldName: 'Website',
        type: 'url',
        sortable: true
    },
    {
        label: 'Rating',
        fieldName: 'Rating',
        type: 'text',
        sortable: true
    }
];

@track error;
@track accList ;
@wire(getAcc)
wiredAccountsmtd({
    error,
    data
}) {
    if (data) {
        this.accList = data;
    } else if (error) {
        this.error = error;
    }
}

}