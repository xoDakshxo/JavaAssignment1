import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class eleven_JDBCOperations {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/SchoolDB";
        String user = "root";
        String password = "Daksh@2023"; // It's not recommended to hardcode passwords in source code

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            try (Connection con = DriverManager.getConnection(url, user, password);
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM student")) {

                // Process the result set
                while (rs.next()) {
                    System.out.println(rs.getString("firstName"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
