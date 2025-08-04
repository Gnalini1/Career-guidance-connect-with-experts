<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerGuidance - Your Career Partner</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }
        
        .header {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
        }
        
        .logo {
            color: #4A90E2;
            font-size: 1.8rem;
            font-weight: bold;
            text-decoration: none;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
        }
        
        .nav-menu a {
            text-decoration: none;
            color: #666;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-menu a:hover, .nav-menu a.active {
            color: #4A90E2;
            border-bottom: 2px solid #4A90E2;
            padding-bottom: 2px;
        }
        
        .auth-buttons {
            display: flex;
            gap: 1rem;
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
            cursor: pointer;
            display: inline-block;
            text-align: center;
        }
        
        .btn-outline {
            background: transparent;
            color: #4A90E2;
            border: 2px solid #4A90E2;
        }
        
        .btn-outline:hover {
            background: #4A90E2;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 144, 226, 0.3);
        }
        
        .btn-primary {
            background: #4A90E2;
            color: white;
            border: 2px solid #4A90E2;
        }
        
        .btn-primary:hover {
            background: #357ABD;
            border-color: #357ABD;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 144, 226, 0.4);
        }
        
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 2rem;
            text-align: center;
        }
        
        .hero-content {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0;
            animation: fadeInUp 0.8s forwards;
        }
        
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0;
            animation: fadeInUp 0.8s 0.2s forwards;
        }
        
        .services-section {
            max-width: 1200px;
            margin: 4rem auto;
            padding: 0 2rem;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .service-card {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            opacity: 0;
            animation: fadeInUp 0.6s forwards;
        }
        
        .service-card:nth-child(1) { animation-delay: 0.1s; }
        .service-card:nth-child(2) { animation-delay: 0.2s; }
        .service-card:nth-child(3) { animation-delay: 0.3s; }
        .service-card:nth-child(4) { animation-delay: 0.4s; }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }
        
        .service-card h3 {
            color: #2c3e50;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .service-card p {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }
        
        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 4rem;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .services-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="nav-container">
            <a href="index.jsp" class="logo">CareerGuidance</a>
            <nav>
                <ul class="nav-menu">
                    <li><a href="#services">Services</a></li>
                    <li><a href="#how-it-works">How It Works</a></li>
                    <li><a href="#experts" class="active">Experts</a></li>
                    <li><a href="#reviews">Reviews</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <a href="login.jsp" class="btn btn-outline">Login</a>
                <a href="register.jsp" class="btn btn-primary">Register</a>
            </div>
        </div>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h1>Unlock Your Career Potential</h1>
            <p>Get personalized guidance from industry experts and take your career to the next level</p>
        </div>
    </section>

    <section class="services-section" id="services">
        <div class="services-grid">
            <div class="service-card">
                <h3>Career Counselling</h3>
                <p>Get personalized guidance from industry experts to discover your ideal career path and make informed decisions about your professional future.</p>
                <a href="career_consult.jsp" class="btn btn-primary">Book Session</a>
            </div>

            <div class="service-card">
                <h3>Mock Interviews</h3>
                <p>Practice with real industry professionals and receive detailed feedback to boost your confidence and improve your interview performance.</p>
                <a href="mock_interview.jsp" class="btn btn-primary">Schedule Mock Interview</a>
            </div>

            <div class="service-card">
                <h3>Resume Building & Review</h3>
                <p>Create compelling resumes that stand out to employers or get your existing resume professionally reviewed and optimized.</p>
                <a href="resume_builder.jsp" class="btn btn-primary">Get Resume Help</a>
            </div>

            <div class="service-card">
                <h3>Expert Consultations</h3>
                <p>One-on-one sessions with industry leaders and career experts to get insider insights and strategic career advice.</p>
                <a href="expert_booking.jsp" class="btn btn-primary">Meet Experts</a>
            </div>
        </div>
    </section>

    <footer class="footer">
        <p>&copy; 2024 CareerGuidance. All rights reserved. Empowering careers, one step at a time.</p>
    </footer>

    <script>
        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Add active class to navigation based on scroll position
        window.addEventListener('scroll', () => {
            const sections = document.querySelectorAll('section[id]');
            const navLinks = document.querySelectorAll('.nav-menu a[href^="#"]');
            
            let current = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (scrollY >= (sectionTop - 200)) {
                    current = section.getAttribute('id');
                }
            });

            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${current}`) {
                    link.classList.add('active');
                }
            });
        });

        // Button click animations
        document.querySelectorAll('.btn').forEach(button => {
            button.addEventListener('click', function(e) {
                // Create ripple effect
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = x + 'px';
                ripple.style.top = y + 'px';
                ripple.classList.add('ripple');
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Check if user is logged in (session check)
        <%
            String user = (String) session.getAttribute("user");
            if (user != null) {
        %>
            // User is logged in, show personalized content
            document.querySelector('.auth-buttons').innerHTML = `
                <span style="color: #4A90E2; margin-right: 1rem;">Welcome, <%= user %></span>
                <a href="dashboard.jsp" class="btn btn-primary">Dashboard</a>
                <a href="logout" class="btn btn-outline">Logout</a>
            `;
        <%
            }
        %>
    </script>

    <style>
        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.4);
            transform: scale(0);
            animation: ripple-animation 0.6s linear;
            pointer-events: none;
        }

        @keyframes ripple-animation {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
    </style>
</body>
</html>
