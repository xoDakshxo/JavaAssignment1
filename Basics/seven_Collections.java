import java.util.*;

public class seven_Collections {

    static class Student implements Comparable<Student> {
        int id;
        String name;

        Student(int id, String name) {
            this.id = id;
            this.name = name;
        }

        @Override
        public int compareTo(Student other) {
            return this.id - other.id; // Sort by ID
        }

        @Override
        public String toString() {
            return "Student{" + "id=" + id + ", name='" + name + '\'' + '}';
        }
    }

    public static void main(String[] args) {
        // List of Students
        List<Student> studentsList = new ArrayList<>();
        studentsList.add(new Student(2, "Alice"));
        studentsList.add(new Student(1, "Bob"));

        // Sorting List
        Collections.sort(studentsList);
        System.out.println("Sorted List: " + studentsList);

        // Set of Students
        Set<Student> studentsSet = new HashSet<>(studentsList);

        // Map of Student to Student
        Map<Student, Student> studentsMap = new HashMap<>();
        for (Student student : studentsList) {
            studentsMap.put(student, student); // Key and Value are same for demonstration
        }
    }
}
