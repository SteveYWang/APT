import java.util.*;
public class AlphaLength 
{
    public ListNode create(String[] words)
    {
        HashSet<String> set = new HashSet<String>();
        for (String word : words) {
            set.add(word);
        }

        String[] strs = set.toArray(new String[set.size()]);
        Arrays.sort(strs);

        ListNode node = new ListNode(strs[0].length());
        ListNode first = node;
        for (int i = 1; i < strs.length; i++) {
            node.next = new ListNode(strs[i].length());
            node = node.next;
        }

        return first;
    }
}
