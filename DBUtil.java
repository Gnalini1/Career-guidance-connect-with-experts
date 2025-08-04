public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/career_guidance";
    private static final String USER = "root";
    private static final String PASSWORD = "Mysql@123";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the driver is loaded
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
