public class TestMethods {
    public Integer findLargestNum(List<Integer> lst){
        integer max = 0;
        integer curr;
        for (Integer i = 0; i < lst.size(); i++){
            lst[i] = curr;
            if (curr > max)
                max = curr;
        }
        return max;
    }
}