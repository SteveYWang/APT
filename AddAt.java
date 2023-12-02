public class AddAt 
{
    public ListNode addAt(ListNode list, ListNode toAdd, int index) 
    {    
        if (toAdd == null) {
            return list;
        }

        ListNode ptr = toAdd;
        while (ptr.next != null) {
            ptr = ptr.next;
        }

        if (index == 0) {
            ptr.next = list;
            return toAdd;
        }
        ListNode res = list;
        ListNode node = list;
        for (int i = 0; i < index - 1; i++) {
            node = node.next;
        }
        ListNode first = node;
        ListNode last = node.next;
        first.next = toAdd;
        ptr.next = last;
        return res;
    }
}
