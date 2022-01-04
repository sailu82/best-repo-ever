// declare the class as public or global so that it's visible to Flows
public class LocalDateTime {
  
    // Declare the invocable method and provide a label that appears in the Flow.
    // The first method accepts List<DateTime> and returns List<String>.
	@InvocableMethod(label='Get Local DateTime String')
    public static List<String> localDateTimeBatch(List<DateTime> datetimes){
        
        // Declare the variable to hold the values we will return to the Flow.
        List<String> localDateTimes = new List<String>();
        
        // Loop through the list, call getLocalDatetime for each,
        // and add the result to our localDateTimes list.
        for (DateTime gmtDatetime : datetimes){
            localDateTimes.add(getLocalDatetime(gmtDatetime));
        }
        
        // Return the values to the Flow.
        return localDateTimes;
    }  
    
    public static String getLocalDateTime(DateTime gmtDateTime){
        // This is the complete logic that transforms datetime to string
        return gmtDateTime.format();
    }
}