public class FindPath 
{
    public String path(TreeNode node, int target) 
    {
        String res = pathHelper(node, target, "");
        if (res.equals("")) {
            if (node.info != target) {
                return "nopath";
            }
        }
        return res;
    }

    private String pathHelper(TreeNode node, int target, String pathStr)
    {
        if (node == null) {
            return "";  
        }
        if (node.info == target) {
            return pathStr;
        }

        String left = "N";
        String right = "N";
        if (isPath(node.left, target)) {
            left = pathHelper(node.left, target, pathStr += "0");
        }
        if (isPath(node.right, target)){
            right = pathHelper(node.right, target, pathStr += "1");
        }

        //System.out.println(left + right);
        if (left.equals("N") && right.equals("N")) {
            return "nopath";
        }
        else if (left.equals("N") || right.equals("N")) {
            if (left.equals("N")) {
                return right;
            }
            else {
                return left;
            }
        }
        else {
            if (right.length() == 1) {
                return left;
            }
            return left;
        }
    }

    
    private boolean isPath(TreeNode node, int target)
    {
        if (node == null) {
            return false;
        }
        if (node.info == target) {
            return true;
        }
        return isPath(node.left, target) || isPath(node.right, target);
    }
}
