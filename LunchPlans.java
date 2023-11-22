import java.util.HashMap;
import java.util.ArrayList;

public class LunchPlans 
{
    public String[] favorites(String[] preferences) 
    {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        ArrayList<String> res = new ArrayList<String>();

        for (String person : preferences) {
            String[] foods = person.split(" ");
            for (String food : foods) {
                map.put(food, map.getOrDefault(food, 0) + 1);
            }
        }

        for (String food : map.keySet()) {
            if (map.get(food) == preferences.length) {
                res.add(food);
            }
        }

        return res.toArray(new String[res.size()]);
    }
}
