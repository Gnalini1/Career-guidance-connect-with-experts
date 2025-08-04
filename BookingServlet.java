package controller;

import dao.BookingDAO;
import model.Booking;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        Booking booking = new Booking();
        booking.setUserId(user.getId());
        booking.setExpertName(req.getParameter("expert_name"));
        booking.setServiceType(req.getParameter("service_type"));
        booking.setBookingDate(LocalDate.parse(req.getParameter("booking_date")));

        boolean result = BookingDAO.addBooking(booking);
        req.setAttribute("message", result ? "Booked Successfully" : "Failed to Book");
        req.getRequestDispatcher("dashboard.jsp").forward(req, res);
    }
}