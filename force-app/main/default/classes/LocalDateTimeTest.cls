@isTest
private class LocalDateTimeTest{
    @isTest
    private static void test_localDateTimeBatch(){
        DateTime now = DateTime.now();
        List<DateTime> dtList = new List<DateTime>();
        dtList.add(now);
        dtList.add(now + 1);
        System.assertEquals(now.format(), LocalDateTime.localDateTimeBatch(dtList)[0]);
    }
}