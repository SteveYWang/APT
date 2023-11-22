import java.util.*;
public class LeafCollector 
{
    public String[] getLeaves(TreeNode node) 
    {
        ArrayList<String> list = new ArrayList<String>();
        while (node.left != null || node.right != null) {
            list.add(getLeavesHelper(node).replaceFirst(" ", ""));
        }
        list.add(node.info + "");
        return list.toArray(new String[list.size()]);
    }

    private String getLeavesHelper(TreeNode node)
    {
        if (node == null) {
            return "";
        }
        if (node.left == null && node.right == null) {
            return " " + node.info;
        }

        String res = "";
        if (node.left != null && node.left.left == null && node.left.right == null) {
            res += " " + node.left.info;
            node.left = null;
        }
        res += getLeavesHelper(node.left);
        if (node.right != null && node.right.left == null && node.right.right == null) {
            res += " " + node.right.info;
            node.right = null;
        }
        res += getLeavesHelper(node.right);
        return res;
    }
}