import java.util.HashSet;
import java.util.Random;

/**
 * @author Thure Nebendahl on 19.06.20
 */
public class Main {

    public static void main(String[] args) {
        Random random = new Random();
        HashSet<String> op = new HashSet<>();
        HashSet<String> unOp = new HashSet<>();
        HashSet<String> predOP = new HashSet<>();
        op.add("Conjunction");
        op.add("Disjunction");
        op.add("StrongNext");
        op.add("WeakNext");
        op.add("StrongPrevious");
        op.add("WeakPrevious");
        op.add("Always");
        op.add("AlwaysPast");
        op.add("Eventually");
        op.add("EventuallyPast");
        op.add("Until");
        op.add("Since");
        op.add("StrongNextPredicate");
        op.add("WeakNextPredicate");
        op.add("StrongPreviousPredicate");
        op.add("WeakPreviousPredicate");
        op.add("AlwaysPredicate");
        op.add("AlwaysPastPredicate");
        op.add("EventuallyPredicate");
        op.add("EventuallyPastPredicate");
        op.add("UntilPredicate");
        op.add("SincePredicate");
        unOp.add("StrongNext");
        unOp.add("WeakNext");
        unOp.add("StrongPrevious");
        unOp.add("WeakPrevious");
        unOp.add("Always");
        unOp.add("AlwaysPast");
        unOp.add("Eventually");
        unOp.add("EventuallyPast");
        unOp.add("StrongNextPredicate");
        unOp.add("WeakNextPredicate");
        unOp.add("StrongPreviousPredicate");
        unOp.add("WeakPreviousPredicate");
        unOp.add("AlwaysPredicate");
        unOp.add("AlwaysPastPredicate");
        unOp.add("EventuallyPredicate");
        unOp.add("EventuallyPastPredicate");
        predOP.add("StrongNextPredicate");
        predOP.add("WeakNextPredicate");
        predOP.add("StrongPreviousPredicate");
        predOP.add("WeakPreviousPredicate");
        predOP.add("AlwaysPredicate");
        predOP.add("AlwaysPastPredicate");
        predOP.add("EventuallyPredicate");
        predOP.add("EventuallyPastPredicate");
        predOP.add("UntilPredicate");
        predOP.add("SincePredicate");
        int counter = 0;
        for (int i = 1; i < 11; i++) {
            for (int j = 0; j < 10; j++) {
                counter++;
                String temp = generateRTQ(op, unOp, predOP, random, i);
                System.out.println(counter+".");
                System.out.println(temp+";\n");
            }
            System.out.println();
        }
    }

    public static String generateRTQ(HashSet<String> op, HashSet<String> unOp, HashSet<String> predOP, Random random, int length) {
        if (length == 0) {
            return "new AtemporalQuery( \"SELECT url FROM autos WHERE NOT deleted\" )";
        }
        String temp = "";
        int item = random.nextInt(op.size());
        int i = 0;
        for (String s : op) {
            if (i == item) {
                temp = s;
            }
            i++;
        }
        if (predOP.contains(temp)) {
            int pred = random.nextInt(10);
            if (unOp.contains(temp)) {
                return "new " + temp + " ( " + generateRTQ(op, unOp, predOP, random, length - 1) + ", " + pred + " )";
            } else {
                int m = random.nextInt(length);
                return "new " + temp + " ( " + generateRTQ(op, unOp, predOP, random, m) + ", " + generateRTQ(op, unOp, predOP, random, length - m - 1) + ", " + pred + " )";
            }
        }
        if (unOp.contains(temp)) {
            return "new " + temp + " ( " + generateRTQ(op, unOp, predOP, random, length - 1) + " )";
        } else {
            int m = random.nextInt(length);
            return "new "+ temp + " ( " + generateRTQ(op, unOp, predOP, random, m) + ", " + generateRTQ(op, unOp, predOP, random, length - m - 1) + " )";
        }
    }
}
