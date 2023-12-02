public class ListMutation 
{
    public ListNode alter(ListNode list) 
    {
        if (list == null) {
            return null;
        }

        if (list.info % 2 == 1) {
            return alter(list.next);
        }
        ListNode temp = list.next;
        list.next = new ListNode(list.info);
        list.next.next = alter(temp);
        return list;
    }
}
