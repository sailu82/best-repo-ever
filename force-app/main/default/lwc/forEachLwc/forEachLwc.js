import { LightningElement } from 'lwc';

export default class ForEachLwc extends LightningElement {

    studentdetails=[
        {
            Id:1,
            Name: "student1",
            Branch:"ECE",

        },
        {
            Id:2,
            Name: "student2",
            Branch:"CSE",
        },
        {
            Id:3,
            Name: "student3",
            Branch:"CSIT",
        },
        {
            Id:4,
            Name: "student4",
            Branch:"EEE",
        },
    ];
    
}