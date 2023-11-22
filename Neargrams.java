import java.util.HashMap;
import java.util.HashSet;

public class Neargrams 
{
    public int numOfNeargrams(String words) 
    {
        String[] wordArr = words.split(" ");
        int res = 0;

        for (int i = 0; i < wordArr.length - 1; i++) {
            for (int j = i + 1; j < wordArr.length; j++) {
                if (isNeargram(wordArr[i], wordArr[j])) {
                    res++;
                }
            }
        }

        return res;
    }

    private boolean isNeargram(String word1, String word2)
    {
        HashMap<Character, Integer> mapOne = new HashMap<Character, Integer>();
        HashMap<Character, Integer> mapTwo = new HashMap<Character, Integer>();
        HashSet<Character> set = new HashSet<Character>();

        for (int i = 0; i < word1.length(); i++) {
            char letter = word1.charAt(i);
            mapOne.put(letter, mapOne.getOrDefault(letter, 0) + 1);
            set.add(letter);
        }
        for (int i = 0; i < word2.length(); i++) {
            char letter = word2.charAt(i);
            mapTwo.put(letter, mapTwo.getOrDefault(letter, 0) + 1);
        }

        for (char letter : set) {
            if (!mapTwo.containsKey(letter)) {
                return false;
            }
            else if (Math.abs(mapTwo.get(letter) - mapOne.get(letter)) > 1) {
                return false;
            }
            
            mapTwo.remove(letter);
        }

        return mapTwo.size() == 0;
    }
}
