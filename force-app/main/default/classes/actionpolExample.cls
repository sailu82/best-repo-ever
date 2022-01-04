public class actionpolExample {
    integer count=0;
    public pageReference incrementcount(){
        count++;
        return null;
    }
    public integer getcount(){
        return count;
    }
}