public class six_ExceptionHandling {

    public static void main(String[] args) {
        try {
            // Simulate an exception
            int division = 10 / 0;
        } catch (ArithmeticException e) {
            System.out.println("ArithmeticException caught: " + e.getMessage());
        } finally {
            System.out.println("Finally block executed.");
        }

        // Using 'throw' to simulate an exception
        try {
            validateAge(15);
        } catch (Exception e) {
            System.out.println("Exception caught: " + e.getMessage());
        }
    }

    // Method with 'throws' declaration
    static void validateAge(int age) throws Exception {
        if (age < 18) {
            throw new Exception("Not eligible for voting");
        } else {
            System.out.println("Eligible for voting");
        }
    }
}
