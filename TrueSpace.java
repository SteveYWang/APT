import java.lang.Math;
public class TrueSpace 
{
    public long calculateSpace(int[] sizes, int clusterSize)
    {
        long res = 0;
        for (int num : sizes) {
            res += (Math.ceil(num * 1.0 / clusterSize)) * clusterSize;
        }
        return res;
    }
}
