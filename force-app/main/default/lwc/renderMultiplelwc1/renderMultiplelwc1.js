import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html'
import signupTemplate from './signupTemplate.html'
import defaultTemplate from './renderMultiplelwc1.html'
export default class RenderMultiplelwc1 extends LightningElement {
    selected = null;
    render(){
        return this.selected === 'Sign Up' ? signupTemplate:
        this.selected === 'Sign In'? signinTemplate:
        defaultTemplate
    }
    handleClick(event){
        this.selected = event.target.label
    }
    submitHandler(event){
        if(event.target.label === 'Sign In'){
            console.log("Sign In Successfully")
        } else if (event.target.label === 'Sign Up'){
            console.log("Sign Up Successfully")
        } else {

        }
    }
}