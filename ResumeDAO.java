package dao;

import controller.DBUtil;
import model.Resume;
import java.sql.*;

public class ResumeDAO {
    public static boolean saveResume(Resume resume) {
        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO resumes (user_id, resume_text) VALUES (?, ?)");
            ps.setInt(1, resume.getUserId());
            ps.setString(2, resume.getResumeText());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}