public class ListsEqual 
{
    public int equal (ListNode a1, ListNode a2)
    {
        ListNode one = a1;
        ListNode two = a2;

        while (one != null && two != null) {
            if (one.info != two.info) {
                return 0;
            }
            one = one.next;
            two = two.next;
        }

        if (one == null && two == null) {
            return 1;
        }
        return 0;
    }
}
