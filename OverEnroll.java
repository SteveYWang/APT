import java.util.HashMap;

public class OverEnroll 
{
    public String[] popular(String[] data) 
    {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int min = Integer.MAX_VALUE;
        int max = 0;
        String[] res = new String[2];

        for (String entry : data) {
            String[] info = entry.split(":");
            map.put(info[0], map.getOrDefault(info[0], 0) + Integer.parseInt(info[2]));

            if (map.get(info[0]) > max) {
                max = map.get(info[0]);
            }
            if (map.get(info[0]) < min) {
                min = map.get(info[0]);
            }
        }

        for (String course : map.keySet()) {
            if (map.get(course) == max) {
                res[0] = course + ":" + map.get(course);
            }
            else if (map.get(course) == min) {
                res[1] = course + ":" + map.get(course);
            }
        }

        return res;
    }
}
