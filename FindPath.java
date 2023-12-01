public class FindPath 
{
    public String path(TreeNode node, int target) 
    {
        return pathHelper(node, target, "");
    }

    private String pathHelper(TreeNode node, int target, String pathStr)
    {
        if (node == null) {
            return "nopath";  
        }
        if (node.info == target) {
            return pathStr;
        }

        String left = pathHelper(node.left, target, pathStr += "0");
        left = "N";
        String right = pathHelper(node.right, target, pathStr += "1");
        
        //System.out.println(left + right);
        if (left.equals("nopath") && right.equals("nopath")) {
            return "nopath";
        }
        else if (left.equals("nopath")) {
            return right;
        }
        else if (right.equals("nopath")){
            return left;
        }
        else if (right.length() > left.length()) {
            return left;
        }
        return right;
    }

    /* 
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
    */
}
