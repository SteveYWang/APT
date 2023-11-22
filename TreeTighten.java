public class TreeTighten 
{
    public TreeNode tighten(TreeNode node) 
    {
        if (node == null) {
            return null;
        }
        if (node.left == null && node.right == null) {
            return node;
        }

        if (node.right == null) {
            node.info = node.left.info;
            node.right = node.left.right;
            node.left = node.left.left;
        }
        else if (node.left == null) {
            node.info = node.right.info;
            node.left = node.right.left;
            node.right = node.right.right;
        }
        node.right = tighten(node.right);
        node.left = tighten(node.left);
        if (!isTight(node)) {
            node = tighten(node);
        }
        return node;
    }

    private boolean isTight(TreeNode node)
    {
        if (node.left == null && node.right == null) {
            return true;
        }
        if (node.left == null || node.right == null) {
            return false;
        }
        return true;
    }
    
}
