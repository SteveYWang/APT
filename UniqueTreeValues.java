import java.util.HashSet;
import java.util.Arrays;
public class UniqueTreeValues 
{
    public int[] unique(TreeNode node)
    {
        HashSet<Integer> set = new HashSet<Integer>();
        uniqueHelper(node, set);

        int[] res = new int[set.size()];
        int i = 0;
        for (int num : set) {
            res[i] = num;
            i++;
        }
        Arrays.sort(res);

        return res;
    }

    private void uniqueHelper(TreeNode node, HashSet<Integer> set)
    {
        if (node == null) {
            return;
        }
        set.add(node.info);
        uniqueHelper(node.left, set);
        uniqueHelper(node.right, set);
    }
}
