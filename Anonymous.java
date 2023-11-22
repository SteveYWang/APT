import java.util.HashMap;
public class Anonymous 
{
    public int howMany(String[] headlines, String[] messages) 
    {
        int res = 0;
        HashMap<Character, Integer> headlineLets = countLetters(headlines);

        for (String word : messages) {
            String[] in = {word};
            HashMap<Character, Integer> messageLets = countLetters(in);
            boolean addRes = true;
            for (int i = 0; i < word.length(); i++) {
                char curr = Character.toLowerCase(word.charAt(i));
                if (curr != ' ') {
                    if (!headlineLets.containsKey(curr)) {
                        addRes = false;
                    }
                    else if (headlineLets.get(curr) < messageLets.get(curr)) {
                        addRes = false;
                    }
                }
            }

            if (addRes) {
                res++;
            }
        }

        return res;
    }

    private HashMap<Character, Integer> countLetters(String[] arr)
    {
        HashMap<Character, Integer> res = new HashMap<Character, Integer>();

        for (String word : arr) {
            for (int i = 0; i < word.length(); i++) {
                char curr = Character.toLowerCase(word.charAt(i));
                if (curr != ' ') {
                    if (!res.containsKey(curr)) {
                        res.put(curr, 1);
                    }
                    else {
                        res.put(curr, res.get(curr) + 1);
                    }
                }
            }
        }

        return res;
    }
}