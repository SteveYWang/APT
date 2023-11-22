public class SoccerLeagues 
{
    public int[] points(String[] matches) {
        int[] res = new int[matches.length];

        for (int i = 0; i < matches.length; i++) {
            for (int j = 0; j < matches[i].length(); j++) {
                if (matches[i].charAt(j) == 'D') {
                    res[i]++;
                    res[j]++;
                }
                else if (matches[i].charAt(j) == 'W') {
                    res[i] += 3;
                }
                else if (matches[i].charAt(j) == 'L') {
                    res[j] += 3;
                }
            }
        }

        return res;
    }
}
