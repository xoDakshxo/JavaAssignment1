public class Three_LoopsAndDecisions {

    public static void main(String[] args) {
        // For loop: Print even numbers from 0 to 10
        for (int i = 0; i <= 10; i++) {
            if (i % 2 == 0) { // Decision making with if-else
                System.out.println("For Loop - Even Number: " + i);
            }
        }

        // While loop: Print numbers from 5 to 1
        int count = 5;
        while (count > 0) {
            System.out.println("While Loop - Count: " + count);
            count--;
        }

        // Switch case: Display day of the week
        int day = 4; // Let's assume 4 represents Thursday
        switch (day) {
            case 1:
                System.out.println("Switch - Monday");
                break;
            case 2:
                System.out.println("Switch - Tuesday");
                break;
            case 3:
                System.out.println("Switch - Wednesday");
                break;
            case 4:
                System.out.println("Switch - Thursday");
                break;
            case 5:
                System.out.println("Switch - Friday");
                break;
            case 6:
                System.out.println("Switch - Saturday");
                break;
            case 7:
                System.out.println("Switch - Sunday");
                break;
            default:
                System.out.println("Switch - Invalid day");
                break;
        }
    }
}
