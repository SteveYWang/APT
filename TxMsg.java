import java.util.HashSet;
public class TxMsg 
{
    public String getMessage(String original) 
    {
        String[] input = original.split(" ");
        String[] res = new String[input.length];
        for (int i = 0; i < input.length; i++) {
            res[i] = abrvWord(input[i]);
        }
        return String.join(" ", res);
    }

    private String abrvWord(String word) 
    {
        char[] vowelsArr = {'a', 'e', 'i', 'o', 'u'};
        HashSet<Character> vowels = new HashSet<>();
        for (char x : vowelsArr) {
            vowels.add(x);
        }

        for (int j = 0; j < word.length(); j++) {
            if (!vowels.contains(word.charAt(j))) {
                break;
            }
            else if (j == word.length() - 1) {
                return word;
            }
        }

        String[] res = new String[word.length()];
        if (vowels.contains(word.charAt(0))) {
            res[0] = "";
        }
        else {
            res[0] = String.valueOf(word.charAt(0));
        }
       
        for (int j = 0; j < word.length() - 1; j++) {
            if (!vowels.contains(word.charAt(j + 1)) && !vowels.contains(word.charAt(j)) || vowels.contains(word.charAt(j + 1))) {
                res[j + 1] = "";
            }
            else {
                res[j + 1] = String.valueOf(word.charAt(j + 1));
            }
        }
        return String.join("", res);
    }
}
