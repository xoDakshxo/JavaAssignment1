// Define interface
interface Vehicle {
    void drive();
}

// Abstract class
abstract class Car implements Vehicle {
    // Encapsulation
    private String brand;

    Car(String brand) {
        this.brand = brand;
    }

    String getBrand() {
        return brand;
    }

    // Abstract method
    abstract void honk();
}

// Inheritance
class Sedan extends Car {
    Sedan(String brand) {
        super(brand);
    }

    // Implementing abstract method
    @Override
    void honk() {
        System.out.println(getBrand() + " Sedan: Beep Beep!");
    }

    // Overriding
    @Override
    public void drive() {
        System.out.println(getBrand() + " Sedan: Driving smoothly.");
    }
}

// Inheritance
class SUV extends Car {
    SUV(String brand) {
        super(brand);
    }

    // Implementing abstract method
    @Override
    void honk() {
        System.out.println(getBrand() + " SUV: Honk Honk!");
    }

    // Overriding
    @Override
    public void drive() {
        System.out.println(getBrand() + " SUV: Driving powerfully.");
    }
}

// Main class
public class Five_InheritanceOverridingPolymorphism {
    public static void main(String[] args) {
        Car mySedan = new Sedan("Toyota");
        Car mySUV = new SUV("Ford");

        // Polymorphism
        mySedan.drive();
        mySUV.drive();

        mySedan.honk();
        mySUV.honk();
    }
}
