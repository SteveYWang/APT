import java.util.*;
public class LengthSort
{
    public String[] sort(String[] values)
    {
        Arrays.sort(values, new sortByLength());
        return values;
    }

    class sortByLength implements Comparator<String>
    {
        @Override
        public int compare(String a, String b)
        {
            int aLen = a.length();
            int bLen = b.length();

            if (aLen == bLen) {
                return a.compareTo(b);
            }
            else if (aLen > bLen) {
                return 1;
            }
            else {
                return -1;
            }
        }
    }
}
