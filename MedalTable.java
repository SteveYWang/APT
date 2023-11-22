import java.util.*;
public class MedalTable 
{
    public String[] generate(String[] results)
    {
        HashMap<String, int[]> medalTracker = new HashMap<String, int[]>();
        for (String str : results) {
            String[] event = str.split(" ");
            for (int i = 0; i < 3; i++) {
                String country = event[i];
                medalTracker.putIfAbsent(country, new int[3]);
                medalTracker.get(country)[i]++;
            }
        }

        String[] res = new String[medalTracker.size()];
        int i = 0;
        for (String country : medalTracker.keySet()) {
            int[] medals = medalTracker.get(country);
            res[i] = country + " " + medals[0] + " " + medals[1] + " " + medals[2]; 
            i++;
        }

        Arrays.sort(res, new sortByMedals(medalTracker));
        return res;
    }    

    class sortByMedals implements Comparator<String>
    {
        HashMap<String, int[]> map;

        public sortByMedals(HashMap<String, int[]> hm)
        {
            map = hm;
        }

        @Override
        public int compare(String a, String b)
        {
            String[] aMedals = a.split(" ");
            String[] bMedals = b.split(" ");
            String aName = aMedals[0];
            String bName = bMedals[0];
            int aGold = Integer.parseInt(aMedals[1]);
            int aSilver = Integer.parseInt(aMedals[2]);
            int aBronze = Integer.parseInt(aMedals[3]);
            int bGold = Integer.parseInt(bMedals[1]);
            int bSilver = Integer.parseInt(bMedals[2]);
            int bBronze = Integer.parseInt(bMedals[3]);
            

            if (aGold > bGold) {
                return -1;
            }
            else if(aGold < bGold) {
                return 1;
            }
            else {
                if (aSilver > bSilver) {
                    return -1;
                }
                else if (aSilver < bSilver) {
                    return 1;
                }
                else {
                    if (aBronze > bBronze) {
                        return -1;
                    }
                    else if (aBronze < bBronze) {
                        return 1;
                    }
                    else {
                        return aName.compareTo(bName);
                    }
                }
            }
        }
    }
}
