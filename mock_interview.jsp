<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mock Interview - CareerGuidance</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .card-hover {
            transition: all 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        .step-active {
            background-color: #10B981;
            color: white;
        }
        .step-completed {
            background-color: #059669;
            color: white;
        }
        .step-inactive {
            background-color: #E5E7EB;
            color: #6B7280;
        }
    </style>
</head>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <div class="flex items-center">
                    <a href="index.jsp" class="text-2xl font-bold text-blue-600">CareerGuidance</a>
                </div>
                
                <div class="flex items-center space-x-4">
                    <a href="dashboard.jsp" class="text-gray-700 hover:text-blue-600 px-3 py-2 rounded-md text-sm font-medium transition duration-300">Dashboard</a>
                    <div class="flex items-center text-gray-700">
                        <img src="https://via.placeholder.com/32x32" class="w-8 h-8 rounded-full mr-2" alt="Profile">
                        <span>${sessionScope.user.name != null ? sessionScope.user.name : 'User'}</span>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- Header Section -->
    <section class="gradient-bg text-white py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h1 class="text-4xl font-bold mb-4">Mock Interview Practice</h1>
            <p class="text-xl mb-8">Practice with industry professionals and receive detailed feedback to boost your interview confidence</p>
            
            <!-- Progress Steps -->
            <div class="flex justify-center items-center space-x-4 mb-8">
                <div class="flex items-center">
                    <div class="w-10 h-10 rounded-full flex items-center justify-center step-active font-semibold">1</div>
                    <span class="ml-2 text-sm">Choose Interview Type</span>
                </div>
                <div class="w-8 h-0.5 bg-white opacity-50"></div>
                <div class="flex items-center">
                    <div class="w-10 h-10 rounded-full flex items-center justify-center step-inactive font-semibold">2</div>
                    <span class="ml-2 text-sm">Select Interviewer</span>
                </div>
                <div class="w-8 h-0.5 bg-white opacity-50"></div>
                <div class="flex items-center">
                    <div class="w-10 h-10 rounded-full flex items-center justify-center step-inactive font-semibold">3</div>
                    <span class="ml-2 text-sm">Schedule & Confirm</span>
                </div>
            </div>
        </div>
    </section>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <!-- Interview Type Selection -->
        <section id="step1" class="mb-12">
            <div class="bg-white rounded-xl shadow-md p-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Choose Your Interview Type</h2>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Technical Interview -->
                    <div class="interview-type-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-green-500 hover:bg-green-50 transition duration-200" data-type="technical">
                        <div class="text-center">
                            <div class="bg-green-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-code text-2xl text-green-600"></i>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">Technical Interview</h3>
                            <p class="text-gray-600 mb-4">Coding challenges, system design, and technical problem-solving</p>
                            <div class="text-sm text-gray-500">
                                <p><i class="fas fa-clock mr-1"></i> 60-90 minutes</p>
                                <p><i class="fas fa-dollar-sign mr-1"></i> $75</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Behavioral Interview -->
                    <div class="interview-type-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-blue-500 hover:bg-blue-50 transition duration-200" data-type="behavioral">
                        <div class="text-center">
                            <div class="bg-blue-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-users text-2xl text-blue-600"></i>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">Behavioral Interview</h3>
                            <p class="text-gray-600 mb-4">Leadership, teamwork, and situational questions</p>
                            <div class="text-sm text-gray-500">
                                <p><i class="fas fa-clock mr-1"></i> 45-60 minutes</p>
                                <p><i class="fas fa-dollar-sign mr-1"></i> $50</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Case Study Interview -->
                    <div class="interview-type-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-purple-500 hover:bg-purple-50 transition duration-200" data-type="case-study">
                        <div class="text-center">
                            <div class="bg-purple-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-chart-line text-2xl text-purple-600"></i>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">Case Study Interview</h3>
                            <p class="text-gray-600 mb-4">Business cases, consulting, and analytical thinking</p>
                            <div class="text-sm text-gray-500">
                                <p><i class="fas fa-clock mr-1"></i> 60 minutes</p>
                                <p><i class="fas fa-dollar-sign mr-1"></i> $65</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- HR/General Interview -->
                    <div class="interview-type-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-orange-500 hover:bg-orange-50 transition duration-200" data-type="hr-general">
                        <div class="text-center">
                            <div class="bg-orange-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-handshake text-2xl text-orange-600"></i>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">HR/General Interview</h3>
                            <p class="text-gray-600 mb-4">Company fit, career goals, and general questions</p>
                            <div class="text-sm text-gray-500">
                                <p><i class="fas fa-clock mr-1"></i> 30-45 minutes</p>
                                <p><i class="fas fa-dollar-sign mr-1"></i> $40</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Sales Interview -->
                    <div class="interview-type-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-red-500 hover:bg-red-50 transition duration-200" data-type="sales">
                        <div class="text-center">
                            <div class="bg-red-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-chart-bar text-2xl text-red-600"></i>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">Sales Interview</h3>
                            <p class="text-gray-600 mb-4">Role-playing, objection handling, and sales scenarios</p>
                            <div class="text-sm text-gray-500">
                                <p><i class="fas fa-clock mr-1"></i> 45 minutes</p>
                                <p><i class="fas fa-dollar-sign mr-1"></i> $55</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Panel Interview -->
                    <div class="interview-type-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-indigo-500 hover:bg-indigo-50 transition duration-200" data-type="panel">
                        <div class="text-center">
                            <div class="bg-indigo-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-users-cog text-2xl text-indigo-600"></i>
                            </div>
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">Panel Interview</h3>
                            <p class="text-gray-600 mb-4">Multiple interviewer scenario with diverse questions</p>
                            <div class="text-sm text-gray-500">
                                <p><i class="fas fa-clock mr-1"></i> 75 minutes</p>
                                <p><i class="fas fa-dollar-sign mr-1"></i> $85</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Interviewer Selection -->
        <section id="step2" class="mb-12 hidden">
            <div class="bg-white rounded-xl shadow-md p-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Select Your Interviewer</h2>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6" id="interviewerGrid">
                    <!-- Interviewers will be populated based on selected interview type -->
                </div>
            </div>
        </section>

        <!-- Scheduling -->
        <section id="step3" class="mb-12 hidden">
            <div class="bg-white rounded-xl shadow-md p-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Schedule Your Interview</h2>
                
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <!-- Calendar -->
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-4">Select Date</h3>
                        <div class="bg-gray-50 rounded-lg p-4">
                            <div class="calendar-header flex justify-between items-center mb-4">
                                <button class="text-gray-600 hover:text-gray-900"><i class="fas fa-chevron-left"></i></button>
                                <h4 class="text-lg font-semibold">December 2024</h4>
                                <button class="text-gray-600 hover:text-gray-900"><i class="fas fa-chevron-right"></i></button>
                            </div>
                            
                            <div class="grid grid-cols-7 gap-1 mb-2">
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Sun</div>
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Mon</div>
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Tue</div>
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Wed</div>
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Thu</div>
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Fri</div>
                                <div class="text-center text-sm font-medium text-gray-600 py-2">Sat</div>
                            </div>
                            
                            <div class="grid grid-cols-7 gap-1" id="calendarDays">
                                <!-- Calendar days will be populated by JavaScript -->
                            </div>
                        </div>
                    </div>
                    
                    <!-- Time Slots -->
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-4">Available Time Slots</h3>
                        <div class="space-y-2" id="timeSlots">
                            <p class="text-gray-500">Please select a date to see available time slots</p>
                        </div>
                    </div>
                </div>
                
                <!-- Interview Details Form -->
                <div class="mt-8 pt-8 border-t border-gray-200">
                    <h3 class="text-lg font-semibold text-gray-900 mb-4">Interview Details</h3>
                    <form id="interviewForm">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="experience" class="block text-sm font-medium text-gray-700 mb-2">Experience Level</label>
                                <select id="experience" name="experience" class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    <option value="">Select experience level</option>
                                    <option value="entry">Entry Level (0-2 years)</option>
                                    <option value="mid">Mid Level (3-5 years)</option>
                                    <option value="senior">Senior Level (6-10 years)</option>
                                    <option value="executive">Executive Level (10+ years)</option>
                                </select>
                            </div>
                            
                            <div>
                                <label for="industry" class="block text-sm font-medium text-gray-700 mb-2">Target Industry</label>
                                <select id="industry" name="industry" class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    <option value="">Select industry</option>
                                    <option value="technology">Technology</option>
                                    <option value="finance">Finance</option>
                                    <option value="healthcare">Healthcare</option>
                                    <option value="consulting">Consulting</option>
                                    <option value="retail">Retail</option>
                                    <option value="manufacturing">Manufacturing</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                            
                            <div>
                                <label for="position" class="block text-sm font-medium text-gray-700 mb-2">Target Position</label>
                                <input type="text" id="position" name="position" placeholder="e.g., Software Engineer, Marketing Manager" 
                                       class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            </div>
                            
                            <div>
                                <label for="company" class="block text-sm font-medium text-gray-700 mb-2">Target Company (Optional)</label>
                                <input type="text" id="company" name="company" placeholder="e.g., Google, Microsoft, Apple" 
                                       class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            </div>
                        </div>
                        
                        <div class="mt-6">
                            <label for="specialRequests" class="block text-sm font-medium text-gray-700 mb-2">Special Requests or Focus Areas</label>
                            <textarea id="specialRequests" name="specialRequests" rows="4" 
                                      placeholder="Any specific areas you'd like to focus on or special requirements..."
                                      class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Booking Summary -->
        <section id="bookingSummary" class="mb-12 hidden">
            <div class="bg-white rounded-xl shadow-md p-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Booking Summary</h2>
                
                <div class="bg-gray-50 rounded-lg p-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <h3 class="font-semibold text-gray-900 mb-3">Interview Details</h3>
                            <div class="space-y-2 text-sm">
                                <p><span class="font-medium">Type:</span> <span id="summaryType"></span></p>
                                <p><span class="font-medium">Duration:</span> <span id="summaryDuration"></span></p>
                                <p><span class="font-medium">Date:</span> <span id="summaryDate"></span></p>
                                <p><span class="font-medium">Time:</span> <span id="summaryTime"></span></p>
                                <p><span class="font-medium">Cost:</span> <span id="summaryCost"></span></p>
                            </div>
                        </div>
                        
                        <div>
                            <h3 class="font-semibold text-gray-900 mb-3">Interviewer</h3>
                            <div class="flex items-center">
                                <img id="summaryInterviewerPhoto" src="" class="w-12 h-12 rounded-full mr-3" alt="Interviewer">
                                <div>
                                    <p class="font-medium" id="summaryInterviewerName"></p>
                                    <p class="text-sm text-gray-600" id="summaryInterviewerTitle"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="mt-6 flex justify-between">
                    <button onclick="goToStep(2)" class="bg-gray-300 hover:bg-gray-400 text-gray-700 px-6 py-3 rounded-lg font-medium transition duration-300">
                        Back
                    </button>
                    <button onclick="confirmBooking()" class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-lg font-medium transition duration-300">
                        Confirm Booking
                    </button>
                </div>
            </div>
        </section>

        <!-- Navigation Buttons -->
        <div class="flex justify-between">
            <button id="backBtn" onclick="goBack()" class="bg-gray-300 hover:bg-gray-400 text-gray-700 px-6 py-3 rounded-lg font-medium transition duration-300 hidden">
                Back
            </button>
            <button id="nextBtn" onclick="goNext()" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-medium transition duration-300 ml-auto" disabled>
                Next Step
            </button>
        </div>
    </div>

    <script>
        let currentStep = 1;
        let selectedInterviewType = null;
        let selectedInterviewer = null;
        let selectedDate = null;
        let selectedTime = null;

        // Interview type data
        const interviewTypes = {
            'technical': {
                name: 'Technical Interview',
                duration: '60-90 minutes',
                cost: '$75',
                interviewers: [
                    {id: 1, name: 'John Smith', title: 'Senior Software Engineer at Google', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '10+ years'},
                    {id: 2, name: 'Sarah Wilson', title: 'Tech Lead at Microsoft', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: '8+ years'},
                    {id: 3, name: 'Mike Johnson', title: 'Principal Engineer at Amazon', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '12+ years'}
                ]
            },
            'behavioral': {
                name: 'Behavioral Interview',
                duration: '45-60 minutes',
                cost: '$50',
                interviewers: [
                    {id: 4, name: 'Emily Davis', title: 'HR Director at Apple', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '15+ years'},
                    {id: 5, name: 'David Brown', title: 'People Manager at Netflix', photo: 'https://via.placeholder.com/100x100', rating: 4.7, experience: '12+ years'},
                    {id: 6, name: 'Lisa Chen', title: 'VP of Talent at Uber', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: '10+ years'}
                ]
            },
            'case-study': {
                name: 'Case Study Interview',
                duration: '60 minutes',
                cost: '$65',
                interviewers: [
                    {id: 7, name: 'Robert Taylor', title: 'Senior Consultant at McKinsey', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '8+ years'},
                    {id: 8, name: 'Jennifer Liu', title: 'Principal at BCG', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: '10+ years'},
                    {id: 9, name: 'Alex Rodriguez', title: 'Partner at Bain & Company', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '12+ years'}
                ]
            },
            'hr-general': {
                name: 'HR/General Interview',
                duration: '30-45 minutes',
                cost: '$40',
                interviewers: [
                    {id: 10, name: 'Maria Garcia', title: 'HR Business Partner at Tesla', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: '8+ years'},
                    {id: 11, name: 'James Wilson', title: 'Talent Acquisition Lead at Salesforce', photo: 'https://via.placeholder.com/100x100', rating: 4.7, experience: '6+ years'},
                    {id: 12, name: 'Anna Kim', title: 'People Operations at Airbnb', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '7+ years'}
                ]
            },
            'sales': {
                name: 'Sales Interview',
                duration: '45 minutes',
                cost: '$55',
                interviewers: [
                    {id: 13, name: 'Tom Anderson', title: 'Sales Director at Oracle', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: '12+ years'},
                    {id: 14, name: 'Rachel Green', title: 'VP Sales at HubSpot', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: '10+ years'},
                    {id: 15, name: 'Kevin Lee', title: 'Regional Sales Manager at Zoom', photo: 'https://via.placeholder.com/100x100', rating: 4.7, experience: '8+ years'}
                ]
            },
            'panel': {
                name: 'Panel Interview',
                duration: '75 minutes',
                cost: '$85',
                interviewers: [
                    {id: 16, name: 'Panel Team A', title: 'Mixed Panel (Tech + HR + Manager)', photo: 'https://via.placeholder.com/100x100', rating: 4.9, experience: 'Various'},
                    {id: 17, name: 'Panel Team B', title: 'Leadership Panel (Directors + VPs)', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: 'Various'},
                    {id: 18, name: 'Panel Team C', title: 'Cross-functional Panel', photo: 'https://via.placeholder.com/100x100', rating: 4.8, experience: 'Various'}
                ]
            }
        };

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            setupInterviewTypeSelection();
            generateCalendar();
        });

        function setupInterviewTypeSelection() {
            const cards = document.querySelectorAll('.interview-type-card');
            cards.forEach(card => {
                card.addEventListener('click', function() {
                    // Remove active class from all cards
                    cards.forEach(c => c.classList.remove('border-green-500', 'bg-green-50'));
                    
                    // Add active class to selected card
                    this.classList.add('border-green-500', 'bg-green-50');
                    
                    selectedInterviewType = this.dataset.type;
                    document.getElementById('nextBtn').disabled = false;
                });
            });
        }

        function goNext() {
            if (currentStep === 1 && selectedInterviewType) {
                goToStep(2);
                populateInterviewers();
            } else if (currentStep === 2 && selectedInterviewer) {
                goToStep(3);
            } else if (currentStep === 3 && selectedDate && selectedTime) {
                showBookingSummary();
            }
        }

        function goBack() {
            if (currentStep > 1) {
                goToStep(currentStep - 1);
            }
        }

        function goToStep(step) {
            // Hide all steps
            document.querySelectorAll('section[id^="step"]').forEach(s => s.classList.add('hidden'));
            document.getElementById('bookingSummary').classList.add('hidden');
            
            // Show target step
            document.getElementById('step' + step).classList.remove('hidden');
            
            currentStep = step;
            updateStepIndicators();
            updateButtons();
        }

        function updateStepIndicators() {
            const steps = document.querySelectorAll('.gradient-bg .flex.items-center div:first-child');
            steps.forEach((step, index) => {
                step.classList.remove('step-active', 'step-completed', 'step-inactive');
                if (index + 1 < currentStep) {
                    step.classList.add('step-completed');
                } else if (index + 1 === currentStep) {
                    step.classList.add('step-active');
                } else {
                    step.classList.add('step-inactive');
                }
            });
        }

        function updateButtons() {
            const backBtn = document.getElementById('backBtn');
            const nextBtn = document.getElementById('nextBtn');
            
            if (currentStep === 1) {
                backBtn.classList.add('hidden');
                nextBtn.disabled = !selectedInterviewType;
                nextBtn.textContent = 'Next Step';
            } else if (currentStep === 2) {
                backBtn.classList.remove('hidden');
                nextBtn.disabled = !selectedInterviewer;
                nextBtn.textContent = 'Next Step';
            } else if (currentStep === 3) {
                backBtn.classList.remove('hidden');
                nextBtn.disabled = !(selectedDate && selectedTime);
                nextBtn.textContent = 'Review Booking';
            }
        }

        function populateInterviewers() {
            const grid = document.getElementById('interviewerGrid');
            const interviewers = interviewTypes[selectedInterviewType].interviewers;
            
            grid.innerHTML = '';
            
            interviewers.forEach(interviewer => {
                const card = document.createElement('div');
                card.className = 'interviewer-card border-2 border-gray-200 rounded-xl p-6 cursor-pointer hover:border-blue-500 hover:bg-blue-50 transition duration-200';
                card.dataset.interviewerId = interviewer.id;
                
                card.innerHTML = `
                    <div class="text-center">
                        <img src="${interviewer.photo}" alt="${interviewer.name}" class="w-20 h-20 rounded-full mx-auto mb-4">
                        <h3 class="text-lg font-semibold text-gray-900 mb-1">${interviewer.name}</h3>
                        <p class="text-sm text-gray-600 mb-3">${interviewer.title}</p>
                        <div class="flex justify-center items-center mb-2">
                            <div class="flex text-yellow-400">
                                ${'★'.repeat(Math.floor(interviewer.rating))}
                            </div>
                            <span class="ml-1 text-sm text-gray-600">${interviewer.rating}</span>
                        </div>
                        <p class="text-xs text-gray-500">${interviewer.experience}</p>
                    </div>
                `;
                
                card.addEventListener('click', function() {
                    document.querySelectorAll('.interviewer-card').forEach(c => c.classList.remove('border-blue-500', 'bg-blue-50'));
                    this.classList.add('border-blue-500', 'bg-blue-50');
                    
                    selectedInterviewer = interviewer;
                    document.getElementById('nextBtn').disabled = false;
                });
                
                grid.appendChild(card);
            });
        }

        function generateCalendar() {
            const calendarDays = document.getElementById('calendarDays');
            const today = new Date();
            const currentMonth = today.getMonth();
            const currentYear = today.getFullYear();
            
            // Get first day of month and number of days
            const firstDay = new Date(currentYear, currentMonth, 1).getDay();
            const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
            
            calendarDays.innerHTML = '';
            
            // Add empty cells for days before month starts
            for (let i = 0; i < firstDay; i++) {
                const emptyDay = document.createElement('div');
                emptyDay.className = 'text-center py-2';
                calendarDays.appendChild(emptyDay);
            }
            
            // Add days of month
            for (let day = 1; day <= daysInMonth; day++) {
                const dayElement = document.createElement('div');
                dayElement.className = 'text-center py-2 cursor-pointer hover:bg-blue-100 rounded';
                dayElement.textContent = day;
                
                const dayDate = new Date(currentYear, currentMonth, day);
                if (dayDate >= today && dayDate.getDay() !== 0 && dayDate.getDay() !== 6) { // Exclude weekends and past dates
                    dayElement.classList.add('text-blue-600', 'hover:bg-blue-100');
                    dayElement.addEventListener('click', function() {
                        document.querySelectorAll('#calendarDays div').forEach(d => d.classList.remove('bg-blue-600', 'text-white'));
                        this.classList.add('bg-blue-600', 'text-white');
                        
                        selectedDate = dayDate.toDateString();
                        generateTimeSlots();
                        updateButtons();
                    });
                } else {
                    dayElement.classList.add('text-gray-400');
                }
                
                calendarDays.appendChild(dayElement);
            }
        }

        function generateTimeSlots() {
            const timeSlots = document.getElementById('timeSlots');
            const slots = ['9:00 AM', '10:30 AM', '12:00 PM', '1:30 PM', '3:00 PM', '4:30 PM'];
            
            timeSlots.innerHTML = '';
            
            slots.forEach(time => {
                const slot = document.createElement('button');
                slot.className = 'w-full text-left px-4 py-3 border border-gray-300 rounded-lg hover:border-blue-500 hover:bg-blue-50 transition duration-200';
                slot.textContent = time;
                
                slot.addEventListener('click', function() {
                    document.querySelectorAll('#timeSlots button').forEach(b => b.classList.remove('border-blue-500', 'bg-blue-50'));
                    this.classList.add('border-blue-500', 'bg-blue-50');
                    
                    selectedTime = time;
                    updateButtons();
                });
                
                timeSlots.appendChild(slot);
            });
        }

        function showBookingSummary() {
            document.querySelectorAll('section[id^="step"]').forEach(s => s.classList.add('hidden'));
            document.getElementById('bookingSummary').classList.remove('hidden');
            document.getElementById('nextBtn').classList.add('hidden');
            document.getElementById('backBtn').classList.add('hidden');
            
            // Populate summary
            const typeData = interviewTypes[selectedInterviewType];
            document.getElementById('summaryType').textContent = typeData.name;
            document.getElementById('summaryDuration').textContent = typeData.duration;
            document.getElementById('summaryDate').textContent = selectedDate;
            document.getElementById('summaryTime').textContent = selectedTime;
            document.getElementById('summaryCost').textContent = typeData.cost;
            
            document.getElementById('summaryInterviewerPhoto').src = selectedInterviewer.photo;
            document.getElementById('summaryInterviewerName').textContent = selectedInterviewer.name;
            document.getElementById('summaryInterviewerTitle').textContent = selectedInterviewer.title;
        }

        function confirmBooking() {
            // Here you would typically send the booking data to the server
            alert('Booking confirmed! You will receive a confirmation email shortly.');
            window.location.href = 'dashboard.jsp';
        }
    </script>
</body>
</html>