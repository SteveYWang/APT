import java.util.HashMap;
public class BigWord 
{
    public String most(String[] sentences) 
    {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int maxNum = 0;
        String res = "";

        for (String sentence : sentences) {
            String[] words = sentence.split(" ");
            for (String word : words) {
                word = word.toLowerCase();
                
                if (!map.containsKey(word)) {
                    map.put(word, 1);
                }
                else {
                    map.put(word, map.get(word) + 1);
                }

                if (map.get(word) > maxNum) {
                    maxNum = map.get(word);
                    res = word;
                }
            }
        }

        return res;
    }
}
