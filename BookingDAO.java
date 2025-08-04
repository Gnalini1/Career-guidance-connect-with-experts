package dao;

import controller.DBUtil;
import model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    public static boolean addBooking(Booking booking) {
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO bookings (user_id, expert_name, service_type, booking_date) VALUES (?, ?, ?, ?)");
            ps.setInt(1, booking.getUserId());
            ps.setString(2, booking.getExpertName());
            ps.setString(3, booking.getServiceType());
            ps.setDate(4, Date.valueOf(booking.getBookingDate()));
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Booking> getBookingsByUser(int userId) {
        List<Booking> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE user_id=?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking b = new Booking(
                    rs.getInt("id"), userId,
                    rs.getString("expert_name"),
                    rs.getString("service_type"),
                    rs.getDate("booking_date").toLocalDate()
                );
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}