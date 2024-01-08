public class Two_Basics_DataTypes {

    // Data Types
    int anInteger = 10;
    double aDouble = 5.99;
    char aChar = 'A';
    boolean aBoolean = true;

    // Variable Types
    static int staticVariable = 100;
    final int finalVariable = 50;

    // Modifiers
    public int publicVariable = 1;
    private int privateVariable = 2;
    protected int protectedVariable = 3;
    int defaultVariable = 4;

    // Constructor
    public Two_Basics_DataTypes() {
        anInteger += 5;
    }

    public static void main(String[] args) {
        Two_Basics_DataTypes demo = new Two_Basics_DataTypes();

        // Accessing variables
        System.out.println("Static: " + staticVariable);
        System.out.println("Final: " + demo.finalVariable);
        System.out.println("Public: " + demo.publicVariable);
        System.out.println("Protected: " + demo.protectedVariable);
        System.out.println("Default: " + demo.defaultVariable);
        System.out.println("Modified Integer: " + demo.anInteger);
    }
}
