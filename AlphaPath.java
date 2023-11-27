public class AlphaPath
{
    int rows;
    int cols;

    public String hasPath(String[] maze) 
    {
        rows = maze.length;
        cols = maze[0].length();
        String[][] mazePrime = new String[rows][cols];
        int ind = 0;
        for (String str : maze) {
            mazePrime[ind] = str.split("");
            ind++;
        }

        int[] useInd = new int[2];
        for (int i = 0; i < mazePrime.length; i++) {
            for (int j = 0; j < mazePrime[0].length; j++) {
                if (mazePrime[i][j].equals("A")) {
                    useInd[0] = i;
                    useInd[1] = j;
                    break;
                }
            }
        }

        return hasPathHelper(mazePrime, useInd);
    }

    private String hasPathHelper(String[][] maze, int[] ind) 
    {
        String curr = maze[ind[0]][ind[1]];
        if (curr.equals("Z")) {
            return "YES";
        }

        int current = curr.charAt(0);
        int[] left = {ind[0] - 1, ind[1]};
        int[] right = {ind[0] + 1, ind[1]};
        int[] up = {ind[0], ind[1] - 1};
        int[] down = {ind[0], ind[1] + 1};
        
        if (inBounds(left) && (int) maze[left[0]][left[1]].charAt(0) == current + 1) {
            return hasPathHelper(maze, left);
        }
        else if (inBounds(right) && (int) maze[right[0]][right[1]].charAt(0) == current + 1) {
            return hasPathHelper(maze, right);
        }
        else if (inBounds(up) && (int) maze[up[0]][up[1]].charAt(0) == current + 1) {
            return hasPathHelper(maze, up);
        }
        else if (inBounds(down) && (int) maze[down[0]][down[1]].charAt(0) == current + 1) {
            return hasPathHelper(maze, down);
        }
        else {
            return "NO";
        }
    }

    private boolean inBounds(int[] ind)
    {
        int r = ind[0];
        int c = ind[1];
        return r >= 0 && r < rows && c >= 0 && c < cols;
    }
}