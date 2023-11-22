import java.util.HashSet;
import java.util.Arrays;
public class SimpleWordGame 
{
    public int points(String[] player, String[] dictionary) 
    {
        int score = 0;
        HashSet<String> dict = new HashSet<String>(Arrays.asList(dictionary));
        for (String mem : player) {
            if (dict.contains(mem)) {
                dict.remove(mem);
                score += mem.length() * mem.length();
            }
        }
        return score;
    }
}