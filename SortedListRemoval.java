public class SortedListRemoval
{
    public ListNode uniqify(ListNode list)
    {
        ListNode ptr = list;
        while (ptr != null) {
            ptr.next = nextUnique(ptr);
            ptr = ptr.next;
        }
        return list;
    }

    private ListNode nextUnique(ListNode node)
    {
        ListNode ptr = node;
        while (ptr.next != null) {
            ptr = ptr.next;

            if (ptr.info != node.info) {
                return ptr;
            }
        }

        return null;
    }
}