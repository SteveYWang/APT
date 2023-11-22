import java.lang.Math;
public class HeightLabel
{
    public TreeNode rewire(TreeNode node) 
    {
        if (node == null) {
            return null;
        }
        node.info = height(node);
        rewire(node.left);
        rewire(node.right);
        return node;
    }

    private int height(TreeNode node)
    {
        if (node == null) {
            return 0;
        } 
        if (node.left == null && node.right == null) {
            return 1;
        }
        return 1 + Math.max(height(node.left), height(node.right));
    }
}