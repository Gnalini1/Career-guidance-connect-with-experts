<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*, model.*, java.util.*" %>

<%!
// Declare sanitizeStatus method correctly
public String sanitizeStatus(String status) {
    return (status != null) ? status.toLowerCase().replaceAll("[^a-z]", "") : "default";
}
%>

<%
    // Session validation
    Object userIdObj = session.getAttribute("userId");
    Object userNameObj = session.getAttribute("userName");

    int userId = 0;
    String userName = "";

    try {
        if (userIdObj instanceof Integer) {
            userId = (Integer) userIdObj;
        } else if (userIdObj instanceof String) {
            userId = Integer.parseInt((String) userIdObj);
        }

        if (userNameObj != null) {
            userName = userNameObj.toString();
        }

        if (userId == 0 || userName.trim().isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch user data
    List<CareerSession> sessions = new ArrayList<>();
    List<MockInterview> interviews = new ArrayList<>();
    List<Resume> resumes = new ArrayList<>();

    try {
        CareerSessionDAO sessionDAO = new CareerSessionDAO();
        MockInterviewDAO interviewDAO = new MockInterviewDAO();
        ResumeDAO resumeDAO = new ResumeDAO();

        sessions = Optional.ofNullable(sessionDAO.getSessionsByUserId(userId)).orElse(new ArrayList<>());
        interviews = Optional.ofNullable(interviewDAO.getInterviewsByUserId(userId)).orElse(new ArrayList<>());
        resumes = Optional.ofNullable(resumeDAO.getResumesByUserId(userId)).orElse(new ArrayList<>());
    } catch (Exception e) {
        e.printStackTrace(); // Continue with empty lists if exception
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - CareerGuidance</title>
    <link rel="stylesheet" href="css/style.css"><!-- Your external stylesheet if needed -->
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-logo">
                <h2>CareerGuidance</h2>
            </div>
            <div class="nav-menu">
                <span>Welcome, <%= userName %></span>
                <a href="LogoutServlet" class="btn-logout">Logout</a>
            </div>
        </div>
    </nav>

    <div class="dashboard-container">
        <aside class="sidebar">
            <ul class="sidebar-menu">
                <li><a href="#overview" class="active">Overview</a></li>
                <li><a href="book-session.jsp">Book Session</a></li>
                <li><a href="mock-interview.jsp">Mock Interview</a></li>
                <li><a href="resume-upload.jsp">Resume Upload</a></li>
            </ul>
        </aside>

        <main class="dashboard-main">
            <div class="dashboard-header">
                <h1>Dashboard</h1>
                <p>Manage your career development journey</p>
            </div>

            <!-- Stats -->
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Career Sessions</h3>
                    <div class="stat-number"><%= sessions.size() %></div>
                    <p>Total Sessions</p>
                </div>
                <div class="stat-card">
                    <h3>Mock Interviews</h3>
                    <div class="stat-number"><%= interviews.size() %></div>
                    <p>Interviews Completed</p>
                </div>
                <div class="stat-card">
                    <h3>Resumes</h3>
                    <div class="stat-number"><%= resumes.size() %></div>
                    <p>Resumes Uploaded</p>
                </div>
            </div>

            <!-- Career Sessions Table -->
            <section class="recent-sessions">
                <h2>Recent Career Sessions</h2>
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Session Type</th>
                                <th>Status</th>
                                <th>Scheduled Date</th>
                                <th>Created</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% if (sessions.isEmpty()) { %>
                            <tr>
                                <td colspan="4" class="no-data">No sessions found. <a href="book-session.jsp">Book your first session</a></td>
                            </tr>
                        <% } else {
                            for (CareerSession s : sessions) { %>
                            <tr>
                                <td><%= s.getSessionType() != null ? s.getSessionType() : "N/A" %></td>
                                <td>
                                    <span class="status status-<%= sanitizeStatus(s.getStatus()) %>">
                                        <%= s.getStatus() != null ? s.getStatus() : "Pending" %>
                                    </span>
                                </td>
                                <td><%= s.getScheduledDate() != null ? s.getScheduledDate() : "Not scheduled" %></td>
                                <td><%= s.getCreatedAt() != null ? s.getCreatedAt() : "N/A" %></td>
                            </tr>
                        <% } } %>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Mock Interviews Table -->
            <section class="recent-interviews">
                <h2>Mock Interviews</h2>
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Interview Type</th>
                                <th>Level</th>
                                <th>Status</th>
                                <th>Score</th>
                                <th>Scheduled Date</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% if (interviews.isEmpty()) { %>
                            <tr>
                                <td colspan="5" class="no-data">No interviews scheduled. <a href="mock-interview.jsp">Schedule your first interview</a></td>
                            </tr>
                        <% } else {
                            for (MockInterview i : interviews) { %>
                            <tr>
                                <td><%= i.getInterviewType() != null ? i.getInterviewType() : "N/A" %></td>
                                <td><%= i.getLevel() != null ? i.getLevel() : "N/A" %></td>
                                <td>
                                    <span class="status status-<%= sanitizeStatus(i.getStatus()) %>">
                                        <%= i.getStatus() != null ? i.getStatus() : "Pending" %>
                                    </span>
                                </td>
                                <td><%= i.getScore() > 0 ? i.getScore() + "/100" : "N/A" %></td>
                                <td><%= i.getScheduledDate() != null ? i.getScheduledDate() : "Not scheduled" %></td>
                            </tr>
                        <% } } %>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Resume Upload History Table -->
            <section class="recent-resumes">
                <h2>Resume History</h2>
                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>File Name</th>
                                <th>Status</th>
                                <th>Feedback</th>
                                <th>Uploaded</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% if (resumes.isEmpty()) { %>
                            <tr>
                                <td colspan="4" class="no-data">No resumes uploaded. <a href="resume-upload.jsp">Upload your resume</a></td>
                            </tr>
                        <% } else {
                            for (Resume r : resumes) { %>
                            <tr>
                                <td><%= r.getFileName() != null ? r.getFileName() : "N/A" %></td>
                                <td>
                                    <span class="status status-<%= sanitizeStatus(r.getStatus()) %>">
                                        <%= r.getStatus() != null ? r.getStatus() : "Uploaded" %>
                                    </span>
                                </td>
                                <td><%= r.getFeedback() != null && !r.getFeedback().trim().isEmpty() ? r.getFeedback() : "No feedback yet" %></td>
                                <td><%= r.getCreatedAt() != null ? r.getCreatedAt() : "N/A" %></td>
                            </tr>
                        <% } } %>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
