import java.util.HashMap;
public class Common 
{
    public int count(String a, String b) 
    {
        HashMap<Character, Integer> tracker = new HashMap<Character, Integer>();
        int res = 0;

        for (int i = 0; i < b.length(); i++) {
            char currChar = b.charAt(i);
            if (tracker.containsKey(currChar)) {
                tracker.put(currChar, tracker.get(currChar) + 1);
            }
            else {
                tracker.put(currChar, 1);
            }
        }

        for (int i = 0; i < a.length(); i++) {
            char currChar = a.charAt(i);
            if (tracker.containsKey(currChar) && tracker.get(currChar) != 0) {
                res++;
                tracker.put(currChar, tracker.get(currChar) - 1);
            }
        }

        return res;
    }
}
