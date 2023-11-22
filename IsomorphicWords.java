import java.util.HashMap;
import java.util.ArrayList;
public class IsomorphicWords 
{
    HashMap<Integer, ArrayList<String>> map = new  HashMap<Integer, ArrayList<String>>();

    public int countPairs(String[] words) 
    {
        for (String word : words) {
            int code = getCode(word);
    
            if (!map.containsKey(code)) {
                ArrayList<String> list = new ArrayList<String>();
                list.add(word);
                map.put(code, list);
            }
            else {
                map.get(code).add(word);
            }
        }

        int res = 0;
        for (ArrayList<String> list : map.values()) {
            int nMinus2Fact = fact(list.size() - 2);
            res += (list.size() * (list.size() - 1) * nMinus2Fact) / (2 * nMinus2Fact);
        }

        return res;
    }

    private int getCode(String word)
    {
        int res = 0;
        int it = 1;
        HashMap<Character, Integer> track = new HashMap<Character, Integer>();

        for (int i = 0; i < word.length(); i++) {
            char curr = word.charAt(i);
            if (!track.containsKey(curr)) {
                track.put(curr, it);
                it++;
            }
            res = res * 10 + track.get(curr);
        }

        return res;
    }

    private int fact(int num) {
        int res = 1;
        for (int i = 1; i <= num; i++) {
            res *= i;
        }
        return res;
    }
}
