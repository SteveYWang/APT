public class TreeImbalance 
{
    public int imbalance(TreeNode node) 
    {
        if (node == null) {
            return 0;
        }
        if (node.left == null && node.right == null) {
            return 0;
        }

        int myImbalance = Math.abs(nodeCount(node.left) - nodeCount(node.right));
        int leftImbalance = imbalance(node.left);
        int rightImbalance = imbalance(node.right);

        return Math.max(myImbalance, Math.max(leftImbalance, rightImbalance));
    }

    private int nodeCount(TreeNode node)
    {
        if (node == null) {
            return 0;
        }
        return 1 + nodeCount(node.left) + nodeCount(node.right);
    }
}
