public class Four_StringsAndArrays {

    public static void main(String[] args) {
        // String Operations
        String greeting = "Hello, World!";
        System.out.println("Original String: " + greeting);

        // Converting to uppercase
        String upperCaseGreeting = greeting.toUpperCase();
        System.out.println("Uppercase String: " + upperCaseGreeting);

        // Substring from index 7
        String subString = greeting.substring(7);
        System.out.println("Substring: " + subString);

        // Arrays
        int[] numbers = {3, 6, 9, 12, 15};
        System.out.println("Array of Numbers:");

        // Iterating through array
        for (int i = 0; i < numbers.length; i++) {
            System.out.println("Element at index " + i + ": " + numbers[i]);
        }

        // String Array
        String[] colors = {"Red", "Green", "Blue"};
        System.out.println("Array of Colors:");

        // Enhanced for loop for array iteration
        for (String color : colors) {
            System.out.println(color);
        }
    }
}
