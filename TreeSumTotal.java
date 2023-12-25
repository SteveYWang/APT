public class TreeSumTotal 
{
    public int count(TreeNode node, int target) 
    {
        if (node == null) {
            return 0;
        }

        int thisTreeSum = treeSum(node);
        if (thisTreeSum == target) {
            return 1 + count(node.left, target) + count(node.right, target);
        }
        return count(node.left, target) + count(node.right, target);
    }

    private int treeSum(TreeNode node)
    {
        if (node == null) {
            return 0;
        }
        return node.info + treeSum(node.left) + treeSum(node.right);
    }
}
