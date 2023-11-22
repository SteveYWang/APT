import java.util.*;
public class SortedFreqs
{
    public int[] freqs(String[] data)
    {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        for (String str : data) {
            map.put(str, map.getOrDefault(str, 0) + 1);
        }

        HashSet<String> dataSet = new HashSet<String>(Arrays.asList(data));
        String[] sortee = dataSet.toArray(new String[dataSet.size()]);
        Arrays.sort(sortee);

        int[] res = new int[sortee.length];
        for (int i = 0; i < sortee.length; i++) {
            res[i] = map.get(sortee[i]);
        }

        return res;
    }
}