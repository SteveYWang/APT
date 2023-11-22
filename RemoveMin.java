public class RemoveMin 
{
    public ListNode removeIt(ListNode list)
    {
        ListNode node = list;
        int min = Integer.MAX_VALUE;
        while (node != null) {
            if (node.info < min) {
                min = node.info;
            }
            node = node.next;
        }

        if (list.info == min) {
            return list.next;
        }

        node = list;
        while (node != null && node.next != null) {
            if (node.next.info == min) {
                node.next = node.next.next;
            }
            node = node.next;
        }
        return list;
    }

    public ListNode remove(ListNode node)
    {
        int min = findMin(node, node.info);
        if (node == null || node.next == null) {
            return null;
        }

        if (node.info == min) {
            return node.next;
        }
        if (node.next.info == min) {
            node.next = node.next.next;
            return node;
        }
        node.next = remove(node.next);
        
        return node;
    }

    private int findMin(ListNode node, int smallest)
    {
        if (node == null) {
            return smallest;
        }
        if (node.info < smallest) {
            return findMin(node.next, node.info);
        }
        return findMin(node.next, smallest);
    }
}
