import java.lang.Math;
public class CirclesCountry 
{
    public int leastBorders(int[] x, int[] y, int[] r, int x1, int y1, int x2, int y2)
    {
        int borderCrosses = 0;
        for (int i = 0; i < x.length; i++) {
            boolean isInCircleStart = isInCircle(x1, y1, x[i], y[i], r[i]);
            boolean isInCircleEnd = isInCircle(x2, y2, x[i], y[i], r[i]);
            if (isInCircleStart && isInCircleEnd) {
                continue;
            }
            else if (isInCircleStart || isInCircleEnd) {
                borderCrosses++;
            }
        }
        return borderCrosses;
    }

    private boolean isInCircle(int x, int y, int circleX, int circleY, int circleR)
    {
        return Math.sqrt(((circleX - x) * (circleX - x)) + ((circleY - y) * (circleY - y))) < circleR;
    }
}
