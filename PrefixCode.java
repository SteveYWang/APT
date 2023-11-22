public class PrefixCode 
{
    public String isOne(String[] words) 
    {
        int lowInd = words.length;
        boolean isPrefixCode = true;
        
        for (int i = 0; i < words.length; i++) {
            for (int j = 0; j < words.length; j++) {
                if (i == j) {
                    continue;
                }
                if (words[j].length() < words[i].length()) {
                    continue;
                }
                if (words[i].equals(words[j].substring(0, words[i].length()))) {
                    isPrefixCode = false;
                    if (i < lowInd) {
                        lowInd = i;
                    }
                }
            }
        }
        
        if (isPrefixCode) {
            return "Yes";
        }
        return "No, " + lowInd;
    }
}
