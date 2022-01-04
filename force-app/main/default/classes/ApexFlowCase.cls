public class ApexFlowCase {

    @InvocableMethod(label='Send Email to Contact' 
                     description='send email to contact'category='Case')
    public static void sendEmailToContact(list<string> ids)
    {
       Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
		message.toaddresses = ids;
		message.subject ='your case has been recieved';
		message.PlainTextBody ='your case has been recieved';
        message.setSaveAsActivity(true);
        Messaging.SingleEmailMessage[] messages = new list<Messaging.SingleEmailMessage> {message};
		Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if(results[0].success){
            system.debug('email sent');
        }
        else{
            system.debug('email failed');
        }
    }
}