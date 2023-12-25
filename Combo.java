import java.util.*;
public class Combo 
{
    public static List<List<Integer>> combination(int[] nums, int k)
    {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        helper(res, new ArrayList<Integer>(), nums, k, 0);
        return res;
    }

    private static void helper(List<List<Integer>> res, ArrayList<Integer> list, int[] nums, int k, int start)
    {
        if (list.size() == k) {
            res.add(new ArrayList<Integer>(list));
            return;
        }

        for (int i = start; i < nums.length; ++i) {
            list.add(nums[i]);
            helper(res, list, nums, k, i + 1);
            list.remove(list.size() - 1);
        }
    }

    public static void main(String[] args)
    {
        int[] arr1 = {1, 2, 3, 4, 5};
        List<List<Integer>> test = new ArrayList<List<Integer>>();
        test = combination(arr1, 3);
        for (List<Integer> list : test) {
            for (int num : list) {
                System.out.print(num + " ");
            }
            System.out.println("");
        }
    }
}
