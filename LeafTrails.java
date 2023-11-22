import java.util.*;
public class LeafTrails 
{
    public String[] trails(TreeNode node) 
    {
        TreeMap<Integer, String> map = new TreeMap<Integer, String>();
        trailsHelper(node, map, "");
        return map.values().toArray(new String[map.values().size()]);
    }

    private void trailsHelper(TreeNode node, TreeMap<Integer, String> map, String str)
    {
        if (node == null) {
            return;
        }
        if (node.left == null && node.right == null) {
            map.put(node.info, str);
        }
        trailsHelper(node.left, map, str + "0");
        trailsHelper(node.right, map, str + "1");
    }
}
