public class ListStretch 
{
    public ListNode stretchIt(ListNode list, int amount)
    {
        ListNode first = list;
        while (list != null) {
            for (int i = 1; i < amount; i++) {
                ListNode temp = list.next;
                list.next = new ListNode(list.info, temp);
                list = list.next;
            }   
            list = list.next;
        }
        return first;
    }

    public ListNode stretch(ListNode node, int amount)
    {
        if (node == null) {
            return node;
        }

        ListNode res = node;
        ListNode temp = node.next;
        for (int i = 1; i < amount; i++) {
            node.next = new ListNode(node.info);
            node = node.next;
        }   
        node.next = stretch(temp, amount);
        return res;
    }

}
