<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Consultation - Career Guidance</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .consultation-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: none;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .step-indicator {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        .step {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 10px;
            position: relative;
            color: white;
            font-weight: bold;
        }
        .step.active {
            background: linear-gradient(45deg, #667eea, #764ba2);
        }
        .step.inactive {
            background: #dee2e6;
            color: #6c757d;
        }
        .step:not(:last-child)::after {
            content: '';
            position: absolute;
            left: 100%;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 2px;
            background: #dee2e6;
            margin-left: 10px;
        }
        .btn-primary-custom {
            background: linear-gradient(45deg, #667eea, #764ba2);
            border: none;
            border-radius: 25px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }
        .career-path-card {
            border: 2px solid transparent;
            border-radius: 15px;
            transition: all 0.3s ease;
            cursor: pointer;
            background: white;
        }
        .career-path-card:hover {
            border-color: #667eea;
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.15);
        }
        .career-path-card.selected {
            border-color: #667eea;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .form-step {
            display: none;
        }
        .form-step.active {
            display: block;
            animation: fadeIn 0.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .progress-bar-custom {
            height: 8px;
            border-radius: 10px;
            background: linear-gradient(45deg, #667eea, #764ba2);
        }
        .skill-tag {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            margin: 5px;
            display: inline-block;
            font-size: 0.9rem;
        }
        .recommendation-card {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border-radius: 20px;
            padding: 30px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container py-4">
        <!-- Header -->
        <div class="text-center text-white mb-5">
            <h1 class="display-4 mb-3">
                <i class="fas fa-compass me-3"></i>Career Consultation
            </h1>
            <p class="lead">Discover your ideal career path with our comprehensive assessment</p>
        </div>

        <!-- Step Indicator -->
        <div class="step-indicator mb-4">
            <div class="step active" id="step1">1</div>
            <div class="step inactive" id="step2">2</div>
            <div class="step inactive" id="step3">3</div>
            <div class="step inactive" id="step4">4</div>
            <div class="step inactive" id="step5">5</div>
        </div>

        <!-- Progress Bar -->
        <div class="progress mb-4" style="height: 8px;">
            <div class="progress-bar progress-bar-custom" id="progressBar" style="width: 20%"></div>
        </div>

        <form id="consultationForm" action="ExpertServlet" method="post">
            <!-- Step 1: Personal Information -->
            <div class="consultation-card p-5 form-step active" id="formStep1">
                <h3 class="text-center mb-4 text-primary">
                    <i class="fas fa-user me-2"></i>Personal Information
                </h3>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="fullName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="age" class="form-label">Age</label>
                        <select class="form-select" id="age" name="age" required>
                            <option value="">Select Age Range</option>
                            <option value="16-20">16-20 years</option>
                            <option value="21-25">21-25 years</option>
                            <option value="26-30">26-30 years</option>
                            <option value="31-35">31-35 years</option>
                            <option value="36-40">36-40 years</option>
                            <option value="40+">40+ years</option>
                        </select>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="education" class="form-label">Highest Education Level</label>
                        <select class="form-select" id="education" name="education" required>
                            <option value="">Select Education Level</option>
                            <option value="high_school">High School</option>
                            <option value="diploma">Diploma</option>
                            <option value="bachelor">Bachelor's Degree</option>
                            <option value="master">Master's Degree</option>
                            <option value="phd">PhD</option>
                        </select>
                    </div>
                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-primary-custom" onclick="nextStep()">
                        Next Step <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </div>

            <!-- Step 2: Career Interests -->
            <div class="consultation-card p-5 form-step" id="formStep2">
                <h3 class="text-center mb-4 text-primary">
                    <i class="fas fa-heart me-2"></i>Career Interests
                </h3>
                <p class="text-center text-muted mb-4">Select areas that interest you most (Choose up to 3)</p>
                
                <div class="row">
                    <%
                        String[][] careerFields = {
                            {"technology", "Technology & IT", "fas fa-laptop-code", "Software development, AI, cybersecurity"},
                            {"healthcare", "Healthcare & Medicine", "fas fa-user-md", "Medical practice, nursing, pharmacy"},
                            {"business", "Business & Finance", "fas fa-chart-line", "Management, banking, consulting"},
                            {"education", "Education & Training", "fas fa-graduation-cap", "Teaching, training, academia"},
                            {"creative", "Creative & Design", "fas fa-paint-brush", "Graphic design, writing, arts"},
                            {"engineering", "Engineering", "fas fa-cogs", "Mechanical, civil, electrical engineering"},
                            {"science", "Science & Research", "fas fa-microscope", "Research, laboratory work, analysis"},
                            {"legal", "Legal & Law", "fas fa-gavel", "Law practice, legal consulting"},
                            {"marketing", "Marketing & Sales", "fas fa-bullhorn", "Digital marketing, sales, PR"},
                            {"social", "Social Services", "fas fa-hands-helping", "Social work, counseling, NGOs"}
                        };

                        for (String[] field : careerFields) {
                    %>
                    <div class="col-lg-4 col-md-6 mb-3">
                        <div class="career-path-card p-4 h-100" onclick="toggleCareerField(this, '<%= field[0] %>')">
                            <div class="text-center">
                                <i class="<%= field[2] %> fa-3x mb-3"></i>
                                <h5><%= field[1] %></h5>
                                <p class="small text-muted"><%= field[3] %></p>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                
                <input type="hidden" id="selectedFields" name="selectedFields">
                
                <div class="text-center mt-4">
                    <button type="button" class="btn btn-outline-secondary me-3" onclick="prevStep()">
                        <i class="fas fa-arrow-left me-2"></i>Previous
                    </button>
                    <button type="button" class="btn btn-primary-custom" onclick="nextStep()">
                        Next Step <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </div>

            <!-- Step 3: Skills Assessment -->
            <div class="consultation-card p-5 form-step" id="formStep3">
                <h3 class="text-center mb-4 text-primary">
                    <i class="fas fa-tools me-2"></i>Skills Assessment
                </h3>
                
                <div class="mb-4">
                    <label class="form-label">Rate your proficiency in these areas (1-5 scale)</label>
                </div>

                <%
                    String[] skills = {
                        "Communication Skills", "Leadership", "Problem Solving", "Technical Skills",
                        "Teamwork", "Creativity", "Time Management", "Analytical Thinking"
                    };
                    
                    for (int i = 0; i < skills.length; i++) {
                %>
                <div class="mb-4">
                    <label class="form-label"><%= skills[i] %></label>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="text-muted">Beginner</span>
                        <div class="btn-group" role="group">
                            <% for (int j = 1; j <= 5; j++) { %>
                                <input type="radio" class="btn-check" name="skill_<%= i %>" 
                                       id="skill_<%= i %>_<%= j %>" value="<%= j %>" required>
                                <label class="btn btn-outline-primary" for="skill_<%= i %>_<%= j %>"><%= j %></label>
                            <% } %>
                        </div>
                        <span class="text-muted">Expert</span>
                    </div>
                </div>
                <% } %>

                <div class="text-center mt-4">
                    <button type="button" class="btn btn-outline-secondary me-3" onclick="prevStep()">
                        <i class="fas fa-arrow-left me-2"></i>Previous
                    </button>
                    <button type="button" class="btn btn-primary-custom" onclick="nextStep()">
                        Next Step <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </div>

            <!-- Step 4: Career Goals -->
            <div class="consultation-card p-5 form-step" id="formStep4">
                <h3 class="text-center mb-4 text-primary">
                    <i class="fas fa-target me-2"></i>Career Goals
                </h3>
                
                <div class="mb-4">
                    <label for="careerGoal" class="form-label">What is your primary career goal?</label>
                    <select class="form-select" id="careerGoal" name="careerGoal" required>
                        <option value="">Select your goal</option>
                        <option value="career_change">Career Change</option>
                        <option value="skill_upgrade">Skill Upgrade</option>
                        <option value="promotion">Career Advancement</option>
                        <option value="first_job">Get First Job</option>
                        <option value="entrepreneurship">Start Own Business</option>
                        <option value="work_life_balance">Better Work-Life Balance</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="timeframe" class="form-label">When do you want to achieve this goal?</label>
                    <select class="form-select" id="timeframe" name="timeframe" required>
                        <option value="">Select timeframe</option>
                        <option value="3_months">Within 3 months</option>
                        <option value="6_months">Within 6 months</option>
                        <option value="1_year">Within 1 year</option>
                        <option value="2_years">Within 2 years</option>
                        <option value="5_years">Within 5 years</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="challenges" class="form-label">What challenges are you currently facing?</label>
                    <textarea class="form-control" id="challenges" name="challenges" rows="4" 
                              placeholder="Describe any obstacles or concerns you have..."></textarea>
                </div>

                <div class="mb-4">
                    <label for="preferences" class="form-label">Work Environment Preferences</label>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="workPrefs" value="remote" id="remote">
                                <label class="form-check-label" for="remote">Remote Work</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="workPrefs" value="office" id="office">
                                <label class="form-check-label" for="office">Office Environment</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="workPrefs" value="hybrid" id="hybrid">
                                <label class="form-check-label" for="hybrid">Hybrid Work</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="workPrefs" value="flexible" id="flexible">
                                <label class="form-check-label" for="flexible">Flexible Hours</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="workPrefs" value="travel" id="travel">
                                <label class="form-check-label" for="travel">Travel Opportunities</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="workPrefs" value="startup" id="startup">
                                <label class="form-check-label" for="startup">Startup Environment</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="button" class="btn btn-outline-secondary me-3" onclick="prevStep()">
                        <i class="fas fa-arrow-left me-2"></i>Previous
                    </button>
                    <button type="button" class="btn btn-primary-custom" onclick="nextStep()">
                        Next Step <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </div>

            <!-- Step 5: Review & Submit -->
            <div class="consultation-card p-5 form-step" id="formStep5">
                <h3 class="text-center mb-4 text-primary">
                    <i class="fas fa-check-circle me-2"></i>Review & Submit
                </h3>
                
                <div class="recommendation-card">
                    <h4 class="mb-3"><i class="fas fa-lightbulb me-2"></i>Preliminary Recommendations</h4>
                    <div id="recommendations">
                        <p>Based on your responses, we'll provide personalized career recommendations including:</p>
                        <ul>
                            <li>Suitable career paths matching your interests</li>
                            <li>Skills development roadmap</li>
                            <li>Industry insights and trends</li>
                            <li>Next steps for career advancement</li>
                            <li>Learning resources and certifications</li>
                        </ul>
                    </div>
                </div>

                <div class="mb-4">
                    <h5>Consultation Summary:</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Name:</strong> <span id="summaryName">-</span></p>
                            <p><strong>Email:</strong> <span id="summaryEmail">-</span></p>
                            <p><strong>Education:</strong> <span id="summaryEducation">-</span></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Career Goal:</strong> <span id="summaryGoal">-</span></p>
                            <p><strong>Timeframe:</strong> <span id="summaryTimeframe">-</span></p>
                            <p><strong>Selected Fields:</strong> <span id="summaryFields">-</span></p>
                        </div>
                    </div>
                </div>

                <div class="mb-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">
                            I agree to the <a href="#" class="text-primary">Terms and Conditions</a> and <a href="#" class="text-primary">Privacy Policy</a>
                        </label>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="button" class="btn btn-outline-secondary me-3" onclick="prevStep()">
                        <i class="fas fa-arrow-left me-2"></i>Previous
                    </button>
                    <button type="submit" class="btn btn-primary-custom">
                        <i class="fas fa-paper-plane me-2"></i>Submit Consultation
                    </button>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentStep = 1;
        const totalSteps = 5;
        let selectedCareerFields = [];

        function nextStep() {
            if (validateCurrentStep()) {
                if (currentStep < totalSteps) {
                    // Hide current step
                    document.getElementById(`formStep${currentStep}`).classList.remove('active');
                    document.getElementById(`step${currentStep}`).classList.remove('active');
                    document.getElementById(`step${currentStep}`).classList.add('inactive');
                    
                    // Show next step
                    currentStep++;
                    document.getElementById(`formStep${currentStep}`).classList.add('active');
                    document.getElementById(`step${currentStep}`).classList.remove('inactive');
                    document.getElementById(`step${currentStep}`).classList.add('active');
                    
                    // Update progress bar
                    const progress = (currentStep / totalSteps) * 100;
                    document.getElementById('progressBar').style.width = progress + '%';
                    
                    // Update summary on last step
                    if (currentStep === 5) {
                        updateSummary();
                    }
                    
                    // Scroll to top
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                }
            }
        }

        function prevStep() {
            if (currentStep > 1) {
                // Hide current step
                document.getElementById(`formStep${currentStep}`).classList.remove('active');
                document.getElementById(`step${currentStep}`).classList.remove('active');
                document.getElementById(`step${currentStep}`).classList.add('inactive');
                
                // Show previous step
                currentStep--;
                document.getElementById(`formStep${currentStep}`).classList.add('active');
                document.getElementById(`step${currentStep}`).classList.remove('inactive');
                document.getElementById(`step${currentStep}`).classList.add('active');
                
                // Update progress bar
                const progress = (currentStep / totalSteps) * 100;
                document.getElementById('progressBar').style.width = progress + '%';
                
                // Scroll to top
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }
        }

        function validateCurrentStep() {
            const currentStepDiv = document.getElementById(`formStep${currentStep}`);
            const requiredInputs = currentStepDiv.querySelectorAll('input[required], select[required], textarea[required]');
            
            for (let input of requiredInputs) {
                if (!input.value.trim()) {
                    input.focus();
                    alert('Please fill in all required fields.');
                    return false;
                }
            }
            
            // Special validation for step 2 (career interests)
            if (currentStep === 2 && selectedCareerFields.length === 0) {
                alert('Please select at least one career field that interests you.');
                return false;
            }
            
            return true;
        }

        function toggleCareerField(card, fieldId) {
            if (selectedCareerFields.includes(fieldId)) {
                // Remove field
                selectedCareerFields = selectedCareerFields.filter(f => f !== fieldId);
                card.classList.remove('selected');
            } else {
                // Add field (max 3)
                if (selectedCareerFields.length < 3) {
                    selectedCareerFields.push(fieldId);
                    card.classList.add('selected');
                } else {
                    alert('You can select maximum 3 career fields.');
                }
            }
            
            // Update hidden input
            document.getElementById('selectedFields').value = selectedCareerFields.join(',');
        }

        function updateSummary() {
            document.getElementById('summaryName').textContent = document.getElementById('fullName').value;
            document.getElementById('summaryEmail').textContent = document.getElementById('email').value;
            document.getElementById('summaryEducation').textContent = document.getElementById('education').options[document.getElementById('education').selectedIndex].text;
            document.getElementById('summaryGoal').textContent = document.getElementById('careerGoal').options[document.getElementById('careerGoal').selectedIndex].text;
            document.getElementById('summaryTimeframe').textContent = document.getElementById('timeframe').options[document.getElementById('timeframe').selectedIndex].text;
            document.getElementById('summaryFields').textContent = selectedCareerFields.join(', ');
        }

        // Form submission
        document.getElementById('consultationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Show loading state
            const submitBtn = document.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
            submitBtn.disabled = true;
            
            // Simulate form processing
            setTimeout(() => {
                alert('Consultation submitted successfully! You will receive a detailed report via email within 24 hours.');
                // In real application, submit the form data
                // this.submit();
                
                // Reset button
                submitBtn.innerHTML = originalText;
                submitBtn.disabled = false;
            }, 2000);
        });
    </script>
</body>
</html>
