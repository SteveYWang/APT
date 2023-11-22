import java.util.HashMap;

public class Infrequent 
{
    public String find(String[] phrases)
    {
        HashMap<String, Integer> map = new HashMap<String, Integer>();

        for (String phrase : phrases) {
            String[] words = phrase.split(" ");

            for (String word : words) {
                word = word.toLowerCase();
                map.put(word, map.getOrDefault(word, 0) + 1);
            }
        }

        int min = Integer.MAX_VALUE;
        String res = "";
        for (String word : map.keySet()) {
            if (map.get(word) < min) {
                min = map.get(word);
                res = word;
            }
        }

        return res;
    }
}
