package controller;

import dao.ResumeDAO;
import model.Resume;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ResumeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        Resume resume = new Resume();
        resume.setUserId(user.getId());
        resume.setResumeText(req.getParameter("resume_text"));

        boolean result = ResumeDAO.saveResume(resume);
        req.setAttribute("message", result ? "Resume Saved" : "Failed to Save");
        req.getRequestDispatcher("dashboard.jsp").forward(req, res);
    }
}