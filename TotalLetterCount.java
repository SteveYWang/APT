public class TotalLetterCount 
{
    public int total(String[] words, String letter) 
    {
        char charLetter = letter.charAt(0);
        int res = 0;

        for (int i = 0; i < words.length; i++) {
            int count = 0;
            String word = words[i];

            for (int j = 0; j < word.length(); j++) {
                if (word.charAt(j) == charLetter) {
                    count++;
                }
            }

            res += count * i;
        }

        return res;
    }
}
