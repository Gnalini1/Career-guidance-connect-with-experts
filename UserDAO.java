public static boolean register(User user) {
    boolean result = false;
    try {
        Connection conn = DBConnection.getConnection();
        System.out.println("Database connection successful.");

        String sql = "INSERT INTO users (full_name, email, phone, password, experience) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, user.getFullName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPhone());
        ps.setString(4, user.getPassword());
        ps.setString(5, user.getExperience());

        int rowsInserted = ps.executeUpdate();
        System.out.println("Rows inserted: " + rowsInserted);

        if (rowsInserted > 0) {
            result = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return result;
}
