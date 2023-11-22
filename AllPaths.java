import java.util.*;
public class AllPaths 
{
    public String[] paths(TreeNode node) 
    {
        ArrayList<String> res = new ArrayList<String>();
        pathsHelper(node, res, "");
        return res.toArray(new String[res.size()]);
    }

    private void pathsHelper(TreeNode node, ArrayList<String> list, String str)
    {
        if (node == null) {
            return;
        }
        if (node.right == null && node.left == null) {
            str += node.info;
            list.add(str);
        }
        str += node.info + "->";
        pathsHelper(node.left, list, str);
        pathsHelper(node.right, list, str);
    }
}
