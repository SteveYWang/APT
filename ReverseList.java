public class ReverseList 
{
    public static ListNode reverseIt(ListNode first)
    {
        ListNode node0 = first;
        ListNode node1 = first.next;
        node0.next = null;
        while (node1 != null) {
            ListNode temp = node1.next;
            node1.next = node0;
            node0 = node1;
            node1 = temp;
        }
        return node0;
    }

    public static ListNode reverseRec(ListNode node)
    {
        if (node == null) {
            return null;
        }
        if (node.next == null) {
            return node;
        }
        ListNode newFirst = reverseRec(node.next);
        node.next.next = node;
        node.next = null;
        return newFirst;
    }
}
