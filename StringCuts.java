import java.util.HashSet;
import java.util.ArrayList;
public class StringCuts 
{
    public String[] filter(String[] list, int minLength) 
    {
        ArrayList<String> res = new ArrayList<String>();
        HashSet<String> tracker = new HashSet<String>();
        for (String word : list) {
            if (word.length() >= minLength) {
                if (!tracker.contains(word)) {
                    tracker.add(word);
                    res.add(word);
                }
            }
        }
        return res.toArray(new String[res.size()]);
    }
}
