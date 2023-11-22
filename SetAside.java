import java.util.HashMap;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Collections;
public class SetAside 
{
    public String common(String[] list)
    {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        
        for (String item : list) {
            String[] words = item.split(" ");
            HashSet<String> tracker = new HashSet<String>();

            for (String word : words) {
                if (tracker.contains(word)) {
                    continue;
                }
                else {
                    tracker.add(word);
                    map.put(word, map.getOrDefault(word, 0) + 1);
                }
            }
        }

        ArrayList<String> res = new ArrayList<String>();
        for (String word : map.keySet()) {
            if (map.get(word) == list.length) {
                res.add(word);
            }
        }

        Collections.sort(res);
        return String.join(" ", res);
    }
}
