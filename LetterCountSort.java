import java.util.*;
public class LetterCountSort 
{
    public String[] sort(String[] list, String specialChars) 
    {
        SpecialSort sort = new SpecialSort(specialChars);
        Arrays.sort(list, sort);
        return list;
    }

    private class SpecialSort implements Comparator<String>
    {
        HashSet<Character> special;

        public SpecialSort(String specialChars)
        {
            special = new HashSet<Character>();
            for (int i = 0; i < specialChars.length(); i++) {
                special.add(specialChars.charAt(i));
            }
        }

        @Override
        public int compare(String a, String b)
        {
            int aCount = specialCount(a);
            int bCount = specialCount(b);

            if (aCount > bCount) {
                return 1;
            }
            else if (bCount > aCount) {
                return -1;
            }
            else {
                return a.compareTo(b);
            }
        }

        public int specialCount(String str)
        {
            int count = 0;
            for (int i = 0; i < str.length(); i++) {
                if (special.contains(str.charAt(i))) {
                    count++;
                }
            }
            return count;
        }
    }
}
