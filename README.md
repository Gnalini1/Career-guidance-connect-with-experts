## Career Guidance Connect with Experts

A Java-based web application that provides a platform for students or job seekers to connect with career guidance experts. The system allows users to register, log in, and schedule appointments with professionals in various fields. Admins can manage experts and appointments through a dedicated admin panel.

##  Technologies Used

- Java (JSP + Servlets)
- Apache Tomcat Server
- MySQL (Database)
- JDBC
- HTML, CSS, Bootstrap (Frontend)
- JSP (Frontend with backend integration)
- Eclipse IDE (Recommended)

## Project Structure

Career-guidance-connect-with-experts/
│
├── WebContent/
│ ├── css/ # Stylesheets
│ ├── js/ # JavaScript files
│ ├── images/ # Static image assets
│ ├── jsp/ # JSP pages
│ └── WEB-INF/ # web.xml configuration
│
├── src/
│ ├── controller/ # Servlets
│ ├── dao/ # Data Access Layer
│ ├── model/ # JavaBeans / Models
│
├── SQL/
│ └── career_guidance.sql # MySQL DB schema
└── README.md

bash
Copy
Edit

##  Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/Career-guidance-connect-with-experts.git
Import in Eclipse

Open Eclipse IDE.

File → Import → Existing Projects into Workspace.

Select the extracted project folder.

Configure Database

Create a MySQL database named career_guidance.

Run the SQL script found in the /SQL folder to create tables.

Update DB Credentials

Go to dao/DBConnection.java.

Update the username and password as per your local MySQL setup.

Run on Server

Right-click project → Run on Server (Apache Tomcat).

Access the app at: http://localhost:8080/Career-guidance-connect-with-experts

User Roles
Admin

Login to admin panel

Manage experts

View appointments

Expert

Login and manage availability

Respond to user consultations

Student/User

Register/Login

Book sessions with experts

📄 License
This project is open-source and available under the MIT License.


Edit
