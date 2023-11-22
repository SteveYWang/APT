import java.util.*;
public class SortByFreqs 
{
    public String[] sort(String[] data) 
    {
        HashSet<String> set = new HashSet<String>(Arrays.asList(data));
        String[] sortee = set.toArray(new String[set.size()]);
        Arrays.sort(sortee, new sortByOccurance(data));
        return sortee;
    }

    class sortByOccurance implements Comparator<String>
    {
        HashMap<String, Integer> map;

        public sortByOccurance(String[] arr)
        {
            map = new HashMap<String, Integer>();
            for (String str : arr) {
                map.put(str, map.getOrDefault(str, 0) + 1);
            }
        }

        @Override
        public int compare(String a, String b)
        {
            if (map.get(a) > map.get(b)) {
                return -1;
            }
            else if(map.get(a) < map.get(b)) {
                return 1;
            }
            else {
                return a.compareTo(b);
            }
        }
    }
}
