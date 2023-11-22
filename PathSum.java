import java.lang.Math;
public class PathSum 
{
    public int hasPath(int target, TreeNode node){
        if (node == null) {
            return 0;
        }
        if (node.right == null && node.left == null && node.info == target) {
            return 1;
        }
        return Math.max(hasPath(target - node.info, node.left), hasPath(target - node.info, node.right));
    }
}
