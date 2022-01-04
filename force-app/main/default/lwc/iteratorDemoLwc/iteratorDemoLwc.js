import { LightningElement } from 'lwc';

export default class IteratorDemoLwc extends LightningElement {

    
    contacts = [

        { 

         Id : '1000',
         Name : 'student1',
        Branch : 'ECE'
        },
        {
         Id : '1001',
         Name : 'Student2',
        Branch : 'CSIT'
        },
    
        {
            Id : '1002',
            Name : 'Student3',
            Branch : 'EEE'
        },
    {
        Id : '1003',
        Name : 'Student4',
        Branch : 'CSE'
     }
    
    
       ];
}