import java.util.HashMap;
public class CounterAttack 
{
    public int[] analyze(String str, String[] words) 
    {
        int[] res = new int[words.length];
        String[] strArr = str.split(" ");
        HashMap<String, Integer> map = new HashMap<String, Integer>();

        for (String elmt : strArr) {
            if (!map.containsKey(elmt)) {
                map.put(elmt, 1);
            }
            else {
                map.put(elmt, map.get(elmt) + 1);
            }
        }

        for (int i = 0; i < words.length; i++) {
            if (map.get(words[i]) != null) {
                res[i] = map.get(words[i]);
            }
            else {
                res[i] = 0;
            }
        }

        return res;
    }
}
