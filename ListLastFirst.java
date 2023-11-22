public class ListLastFirst 
{
    public ListNode moveIt(ListNode list) 
    {
        if (list == null || list.next == null) {
            return list;
        }

        ListNode first = list;
        while (list.next.next != null) {
            list = list.next;
        }
        list.next.next = first;
        ListNode res = list.next;
        list.next = null;
        return res;
    }

    public ListNode move(ListNode node)
    {
        return moveItHelper(node, node);
    }

    private ListNode moveItHelper(ListNode node, ListNode first)
    {
        if (node == null || node.next == null) {
            return node;
        }
        if (node.next.next == null) {
            node.next.next = first;
            ListNode res = node.next;
            node.next = null;
            return res;
        }
        return moveItHelper(node.next, first);
    }
}
