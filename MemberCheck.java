import java.util.HashSet;
import java.util.Arrays;
public class MemberCheck 
{
    public String[] whosDishonest(String[] club1, String[] club2, String[] club3) 
    {
        HashSet<String> club1Set = new HashSet<String>(Arrays.asList(club1));
        HashSet<String> club2Set = new HashSet<String>(Arrays.asList(club2));
        HashSet<String> club3Set = new HashSet<String>(Arrays.asList(club3));
        HashSet<String> res = new HashSet<String>();

        for (String person : club1) {
            if (club2Set.contains(person) || club3Set.contains(person)) {
                res.add(person);
            }
        }
        for (String person : club2) {
            if (club1Set.contains(person) || club3Set.contains(person)) {
                res.add(person);
            }
        }
        
        String[] ret = res.toArray(new String[res.size()]);
        Arrays.sort(ret);
        return ret;
    }
}
