package controller;

import dao.UserDAO;
import model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String experience = req.getParameter("experience");

        if (!password.equals(confirmPassword)) {
            req.setAttribute("error", "Passwords do not match.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
            return;
        }

        String fullName = firstName + " " + lastName;
        User user = new User(fullName, email, phone, password, experience);

        boolean registered = UserDAO.register(user);

        if (registered) {
            res.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", "Email already exists or registration failed.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
