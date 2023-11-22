import java.util.HashMap;
import java.util.ArrayList;

public class Follower 
{
    public int[] follows(String[] words)
    {
        HashMap<String, ArrayList<Integer>> map = new HashMap<String, ArrayList<Integer>>();
        ArrayList<Integer> res = new ArrayList<Integer>();

        for (int i = words.length - 1; i >= 0; i--) {
            String currWord = words[i];
            map.putIfAbsent(currWord, new ArrayList<Integer>());
            map.get(currWord).add(i);
        }

        for (String currWord : words) {
            ArrayList<Integer> currList = map.get(currWord);
            if (currList.size() > 1) {
                res.add(currList.get(currList.size() - 1));
                currList.remove(currList.size() - 1);
            }
        }

        return intoArray(res);
    }

    private int[] intoArray(ArrayList<Integer> list)
    {
        int[] res = new int[list.size()];

        for (int i = 0; i < list.size(); i++) {
            res[i] = list.get(i);
        }

        return res;
    }
}
