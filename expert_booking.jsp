<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Expert Consultation - Career Guidance</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .expert-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        .expert-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }
        .expert-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fff;
            margin: -50px auto 20px;
            display: block;
        }
        .rating {
            color: #ffc107;
        }
        .price-tag {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
        }
        .booking-form {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }
        .btn-book {
            background: linear-gradient(45deg, #667eea, #764ba2);
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-book:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            color: white;
        }
        .header-section {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="container-fluid py-4">
        <!-- Header Section -->
        <div class="header-section p-4 text-white text-center">
            <h1 class="display-4 mb-3">
                <i class="fas fa-user-tie me-3"></i>Book Expert Consultation
            </h1>
            <p class="lead">Connect with industry professionals for personalized career guidance</p>
        </div>

        <div class="row">
            <!-- Experts List -->
            <div class="col-lg-8">
                <div class="row">
                    <%
                        // Sample expert data - in real application, this would come from database
                        String[][] experts = {
                            {"1", "Dr. Sarah Johnson", "IT Career Specialist", "15+ years experience in tech industry", "4.9", "₹2000", "sarah.jpg", "Available"},
                            {"2", "Prof. Michael Chen", "Business Strategy Expert", "Former Fortune 500 executive", "4.8", "₹2500", "michael.jpg", "Available"},
                            {"3", "Ms. Priya Sharma", "Healthcare Career Advisor", "Medical field specialist", "4.7", "₹1800", "priya.jpg", "Busy"},
                            {"4", "Mr. David Wilson", "Finance & Banking Expert", "Investment banking veteran", "4.9", "₹2200", "david.jpg", "Available"},
                            {"5", "Dr. Anita Patel", "Education Counselor", "Academic pathway specialist", "4.6", "₹1500", "anita.jpg", "Available"},
                            {"6", "Mr. Rajesh Kumar", "Engineering Career Guide", "Mechanical & Civil engineering expert", "4.8", "₹1900", "rajesh.jpg", "Available"}
                        };

                        for (String[] expert : experts) {
                    %>
                    <div class="col-md-6 mb-4">
                        <div class="card expert-card h-100">
                            <div class="card-body text-center pt-5">
                                <img src="https://via.placeholder.com/100/667eea/ffffff?text=<%= expert[1].charAt(0) %>" 
                                     alt="<%= expert[1] %>" class="expert-avatar">
                                
                                <h5 class="card-title text-primary fw-bold"><%= expert[1] %></h5>
                                <p class="text-muted mb-2"><%= expert[2] %></p>
                                <p class="small text-secondary"><%= expert[3] %></p>
                                
                                <div class="rating mb-3">
                                    <% 
                                        double rating = Double.parseDouble(expert[4]);
                                        for (int i = 1; i <= 5; i++) {
                                            if (i <= rating) {
                                    %>
                                                <i class="fas fa-star"></i>
                                    <%      } else if (i - 0.5 <= rating) { %>
                                                <i class="fas fa-star-half-alt"></i>
                                    <%      } else { %>
                                                <i class="far fa-star"></i>
                                    <%      }
                                        }
                                    %>
                                    <span class="ms-2 text-muted">(<%= expert[4] %>)</span>
                                </div>
                                
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="price-tag"><%= expert[5] %>/hour</span>
                                    <span class="badge <%= expert[7].equals("Available") ? "bg-success" : "bg-warning" %>">
                                        <%= expert[7] %>
                                    </span>
                                </div>
                                
                                <button class="btn btn-book w-100" 
                                        onclick="selectExpert('<%= expert[0] %>', '<%= expert[1] %>', '<%= expert[5] %>')"
                                        <%= expert[7].equals("Busy") ? "disabled" : "" %>>
                                    <i class="fas fa-calendar-check me-2"></i>
                                    <%= expert[7].equals("Available") ? "Book Consultation" : "Currently Busy" %>
                                </button>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Booking Form -->
            <div class="col-lg-4">
                <div class="booking-form p-4 sticky-top">
                    <h4 class="text-center mb-4 text-primary">
                        <i class="fas fa-calendar-alt me-2"></i>Book Your Session
                    </h4>
                    
                    <form action="BookingServlet" method="post" id="bookingForm">
                        <div class="mb-3">
                            <label for="expertId" class="form-label">Selected Expert</label>
                            <input type="hidden" id="expertId" name="expertId" required>
                            <input type="text" class="form-control" id="expertName" readonly 
                                   placeholder="Select an expert from the list">
                        </div>

                        <div class="mb-3">
                            <label for="consultationType" class="form-label">Consultation Type</label>
                            <select class="form-select" id="consultationType" name="consultationType" required>
                                <option value="">Choose consultation type</option>
                                <option value="career_guidance">Career Guidance</option>
                                <option value="resume_review">Resume Review</option>
                                <option value="interview_prep">Interview Preparation</option>
                                <option value="skill_assessment">Skill Assessment</option>
                                <option value="industry_insights">Industry Insights</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="preferredDate" class="form-label">Preferred Date</label>
                            <input type="date" class="form-control" id="preferredDate" name="preferredDate" 
                                   min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="preferredTime" class="form-label">Preferred Time</label>
                            <select class="form-select" id="preferredTime" name="preferredTime" required>
                                <option value="">Select time slot</option>
                                <option value="09:00">09:00 AM</option>
                                <option value="10:00">10:00 AM</option>
                                <option value="11:00">11:00 AM</option>
                                <option value="14:00">02:00 PM</option>
                                <option value="15:00">03:00 PM</option>
                                <option value="16:00">04:00 PM</option>
                                <option value="17:00">05:00 PM</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="duration" class="form-label">Session Duration</label>
                            <select class="form-select" id="duration" name="duration" required onchange="calculateTotal()">
                                <option value="">Select duration</option>
                                <option value="30">30 minutes</option>
                                <option value="60">1 hour</option>
                                <option value="90">1.5 hours</option>
                                <option value="120">2 hours</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="message" class="form-label">Additional Message (Optional)</label>
                            <textarea class="form-control" id="message" name="message" rows="3" 
                                      placeholder="Any specific topics you'd like to discuss..."></textarea>
                        </div>

                        <div class="mb-4">
                            <div class="card bg-light">
                                <div class="card-body">
                                    <h6 class="card-title">Booking Summary</h6>
                                    <div class="d-flex justify-content-between">
                                        <span>Total Amount:</span>
                                        <strong id="totalAmount">₹0</strong>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-book w-100 py-3">
                            <i class="fas fa-credit-card me-2"></i>Confirm Booking
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        let selectedExpertPrice = 0;

        function selectExpert(id, name, price) {
            document.getElementById('expertId').value = id;
            document.getElementById('expertName').value = name;
            selectedExpertPrice = parseInt(price.replace('₹', ''));
            calculateTotal();
            
            // Scroll to booking form on mobile
            if (window.innerWidth < 992) {
                document.querySelector('.booking-form').scrollIntoView({ behavior: 'smooth' });
            }
        }

        function calculateTotal() {
            const duration = document.getElementById('duration').value;
            if (duration && selectedExpertPrice > 0) {
                const hours = duration / 60;
                const total = Math.round(selectedExpertPrice * hours);
                document.getElementById('totalAmount').textContent = '₹' + total;
            } else {
                document.getElementById('totalAmount').textContent = '₹0';
            }
        }

        // Form validation
        document.getElementById('bookingForm').addEventListener('submit', function(e) {
            if (!document.getElementById('expertId').value) {
                e.preventDefault();
                alert('Please select an expert first!');
                return false;
            }
        });

        // Set minimum date to today
        document.getElementById('preferredDate').min = new Date().toISOString().split('T')[0];
    </script>
</body>
</html>