package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ExpertServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Placeholder to show expert panel or list
        req.getRequestDispatcher("expert_booking.jsp").forward(req, res);
    }
}