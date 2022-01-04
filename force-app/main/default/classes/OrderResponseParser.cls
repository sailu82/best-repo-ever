public class OrderResponseParser {
    public string status;
    public string customerId;
    public string txn_id;
    public list <orderDetails> orders;
    
    public class orderDetails{
        
        public string orderId;
        public Decimal amount;
        public string orderCreatedDate;
        public list <string> locations;
        
    }
    
    

}