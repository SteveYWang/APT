public class PairDown 
{
    public int[] fold(int[] list) 
    {
        int[] res = new int[list.length / 2 + list.length % 2];

        int ind = 0;
        for (int i = 0; i < list.length; i += 2) {
            if (i + 1 < list.length) {
                res[ind] = list[i] + list[i + 1];
            }
            else {
                res[ind] = list[i];
            }
            ind++;
        }

        return res;
    }
}
