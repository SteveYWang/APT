import java.util.ArrayList;
import java.util.Arrays;
public class SortedLeaves 
{
    public String[] values(TreeNode node) 
    {
        ArrayList<String> arr = new ArrayList<String>();
        valuesHelper(node, arr);
        String[] ret = arr.toArray(new String[arr.size()]);        
        Arrays.sort(ret);
        return ret;
    }

    private void valuesHelper(TreeNode node, ArrayList<String> list)
    {
        if (node == null) {
           return;
        }
        if (node.left == null && node.right == null) {
            list.add(getString(node));
        }
        valuesHelper(node.right, list);
        valuesHelper(node.left, list);
    }

    private String getString(TreeNode node)
    {
        char res = (char) node.info;
        return res + "";
    }
}
