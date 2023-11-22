import java.util.ArrayList;
import java.util.HashMap;

public class Varied 
{
    public String[] variedStrings(String[] words) 
    {
        ArrayList<String> list = new ArrayList<String>();

        for (String word : words) {
            if (isVaried(word)) {
                list.add(word);
            }
        }

        return list.toArray(new String[list.size()]);
    }   
    
    private boolean isVaried(String word)
    {
        HashMap<Character, Integer> map = new HashMap<Character, Integer>();

        for (int i = 0; i < word.length(); i++) {
            char curr = word.charAt(i);
            map.put(curr, map.getOrDefault(curr, 0) + 1);

            if (map.get(curr) > 1) {
                return false;
            }
        }

        return true;
    }
}
