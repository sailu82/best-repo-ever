import { LightningElement,wire} from 'lwc'; 
import verifyAddress from '@salesforce/apex/LocationTriggerHandler.verifyAddress';
        export default class interConnectionPatientAuthorization extends LightningElement {        
        pictureUrl = 'https://interconnectsupport.iassist.com/images/intercept/interconnect_logo.png';
         picture1Url ='https://interconnectsupport.iassist.com/images/intercept/intercept-logo-footer.png';        
        State = 'Select State';
        City ='';             
        FirstName='';
        MiddleName='';
        LastName='';
        Address='';
        PostalCode='';
        value1 = '';
        email ='';
        SSN='';
        dob='';
        phone='';
    get options1() {         
        return [
            { label: 'Male', value1: 'option1' },
            { label: 'Female', value1: 'option2' },
        ];
    }
    handleInputChange1(event){
      this.FirstName = event.detail.value ;
    }
    handleInputChange3(event){
      this.LastName=event.detail.value ; 
    }
    handleInputChange2(event){ 
      this.MiddleName=event.detail.value ;
    }
    handleCityChange(event){
        this.City = event.detail.value;
    }
    handleStateChange(event)
    {
    this.State = event.detail.value;
    }
    handlePostalCodeChange(event)
    {
        this.PostalCode = event.detail.value;
    }
    handleContinue(event){          
       console.log('City'+this.City);
       console.log('State'+this.State);
       console.log('PostalCode'+this.PostalCode)
               verifyAddress ({FirstName:this.FirstName,MiddleName:this.MiddleName,LastName:this.LastName,City:this.City,State:this.State, PostalCode:this.PostalCode,})
           .then(result=> {
           
            console.log('result'+result);
            var verify = result;
            console.log('verify:'+verify);
            console.log('type:'+typeof(verify));
           
           if(verify==false)
            {
                console.log('validationSucess')
                throw error('conflict');
             
            }         
        })
        .catch(error =>{})
    } 
     
        get options() {
        return [                       
            { label: 'Alabama', value: 'alabama' },
            { label: 'Alaska', value: 'Alaska' },
            { label: 'Arizona', value: 'Arizona' },
            { label: 'Arkansas', value: 'Arkansas' },
            { label: 'California', value: 'California' },
            { label: 'Colorado', value: 'Colorado' },
            { label: 'Connecticut', value: 'Connecticut' },
            { label: 'Delaware', value: 'Delaware' },
            { label: 'Florida', value: 'Florida' },
            { label: 'Georgia', value: 'Georgia' },
            { label: 'Hawaii', value: 'Hawaii' },
            { label: 'Idaho', value: 'Idaho' },
            { label: 'Illinois', value: 'Illinois' },
            { label: 'Indiana', value: 'Indiana' },
            { label: 'Iowa', value: 'Iowa' },
            { label: 'Kansas', value: 'Kansas' },
            { label: 'Kentucky', value: 'Kentucky' },
            { label: 'Louisiana', value: 'Louisiana' },
            { label: 'Maine', value: 'Maine' },
            { label: 'Maryland', value: 'Maryland' },
            { label: 'Massachusetts', value: 'Massachusetts' },
            { label: 'Michigan', value: 'Michigan' },
            { label: 'Minnesota', value: 'Minnesota' },
            { label: 'Mississippi', value: 'Mississippi' },
            { label: 'Missouri', value: 'Missouri' },
            { label: 'Montana', value: 'Montana' },
            { label: 'Nebraska', value: 'Nebraska' },
            { label: 'Nevada', value: 'Nevada' },
            { label: 'New Hampshire', value: 'New Hampshire' },
            { label: 'New Jersey', value: 'New Jersey' },
            { label: 'New Mexico', value: 'New Mexico' },
            { label: 'New York', value: 'New York' },
            { label: 'North Carolina', value: 'North Carolina' },
            { label: 'North Dakota', value: 'North Dakota' },
            { label: 'Ohio', value: 'Ohio' },
            { label: 'Oklahoma', value: 'Oklahoma' },
            { label: 'Oregon', value: 'Oregon' },
            { label: 'Pennsylvania', value: 'Pennsylvania' },
            { label: 'Rhode Island', value: 'Rhode Island' },
            { label: 'South Carolina', value: 'South Carolina' },
            { label: 'South Dakota', value: 'South Dakota' },
            { label: 'Tennessee', value: 'Tennessee' },
            { label: 'Texas', value: 'Texas' },
            { label: ' Utah', value: ' Utah' },
            { label: 'Vermont', value: 'Vermont' },
            { label: 'Virginia', value: 'Virginia' },
            { label: 'Washington', value: 'Washington' },
            { label: 'West Virginia', value: 'West Virginia' },
            { label: 'Wisconsin', value: 'Wisconsin' },
            { label: 'Wyoming', value: 'Wyoming' },
        ];
    }
        }